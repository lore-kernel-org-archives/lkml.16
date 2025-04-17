Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A943221517D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872600; cv=none; b=qbZF9X2MaV778T2KWhiDXcH/mYW9cIGWFCyrZHbxeWOGn5AvPG2xnAslqyHNcXx4I0hWl0EUfRzyGNv/0PRyeGD7JKw1R2/Y3B3qX5PS/Va/rI0actbi20T9VtFf7jAThijT4ZrgUAKU5A52aTXX+YljRT0pOe/SIKESVYbMN+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872600; c=relaxed/simple;
	bh=UErh6bV6SHHEsvkhQXXNwjSjG/7ukkr3U1JEjAGk9UU=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=p2ouzg8AdVjo1Z09Q1o/l0BuCA08Qk+F4YKDSm1/eSMSdymagOSRHuaDc2lo7jxDzVp+pECATFrutfUfAmez2BPGjdMBQIJ4egH/5SFUCl2/k2UgOhNEbW6xsCz5MMzE3P5rpkXCaKebk8hlAiiL82Cu22WDyqoGzGKrJXc1iXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.1.26] (dynamic-176-000-055-081.176.0.pool.telefonica.de [176.0.55.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 45D6561E64782;
	Thu, 17 Apr 2025 08:49:05 +0200 (CEST)
Message-ID: <074c2637-1b65-428e-b3e2-24384780e936@molgen.mpg.de>
Date: Thu, 17 Apr 2025 08:49:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: e820: Undefined type not treated as AddressRangeReserved
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Linux folks,


Some firmware, like coreboot with older FILO payload [1] or GRUB as 
payload [2], mark memory regions(?) with type E820 type 13 (Undefined), 
that is reserved for future use. Other payloads like SeaBIOS mark it as 
2 (AddressRangeReserved). As a result, userspace is not able to access 
this region, which can be worked around by booting with `iomem=relaxed`, 
or probably with the `memmap` parameter.

     $ grep -A1 3ff7b000 /proc/iomem # FILO
     3ff7b000-3fffffff : Unknown E820 type
       3ffa1000-3ffa8fff : BOOT0000:00

     $ grep -A1 3ff7b000 /proc/iomem # SeaBIOS, that marks it as reserved
     3ff7b000-3fffffff : Reserved
       3ffa1000-3ffa8fff : BOOT0000:00

Table 15-374 *Address Range Types* in the ACPI specification 6.3 says:

 > Reserved for future use. OSPM must treat any range of this type as if
 > the type returned was AddressRangeReserved.

Could and should Linux be adapted to follow the specification, and fix 
some real-world use cases? I looked at 
`arch/x86/include/asm/e820/types.h` and `arch/x86/kernel/e820.c`, but 
failed to find the place where to implement this, and how to name the 
macros for the undefined regions.


Kind regards,

Paul


[1]: https://review.coreboot.org/c/filo/+/51120
[2]: https://ticket.coreboot.org/issues/590
[3]: https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf


diff --git a/arch/x86/include/asm/e820/types.h 
b/arch/x86/include/asm/e820/types.h
index 80c4a7266629..1b341914d438 100644
--- a/arch/x86/include/asm/e820/types.h
+++ b/arch/x86/include/asm/e820/types.h
@@ -14,6 +14,10 @@ enum e820_type {
         E820_TYPE_NVS           = 4,
         E820_TYPE_UNUSABLE      = 5,
         E820_TYPE_PMEM          = 7,
+       E820_TYPE_UNDEFINED_8   = 8, /* reserved for future use */
+       E820_TYPE_UNDEFINED_9   = 9, /* reserved for future use */
+       E820_TYPE_UNDEFINED_10  = 10, /* reserved for future use */
+       E820_TYPE_UNDEFINED_11  = 11, /* reserved for future use */

         /*
          * This is a non-standardized way to represent ADR or
@@ -28,6 +32,8 @@ enum e820_type {
          */
         E820_TYPE_PRAM          = 12,

+       E820_TYPE_UNDEFINED_13  = 13, /* reserved for future use */
+
         /*
          * Special-purpose memory is indicated to the system via the
          * EFI_MEMORY_SP attribute. Define an e820 translation of this
