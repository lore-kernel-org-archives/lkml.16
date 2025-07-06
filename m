Received: from mail.mixaill.net (mail.mixaill.net [144.76.234.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF01215D1
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.234.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751820165; cv=none; b=jLK2fzYN9D5CJJpqNl11RbflBxKC9SY3XJq86FYsF64qUgQhHRtg0YdmjSHrzR/1w0Q/ZvAM13TH68phSDmUU8QHz9F5SzPgymZT6grjjdFTtLryGzPochcl4Zge1/q/jMKabzOA68vn4SKbvFn16ZWDcNFmmwZF01jz4HU+KQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751820165; c=relaxed/simple;
	bh=RrhRXoot1qI7JpF7gfO4uNTsUe8djv23HWBolUy5FcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8XMHuQoUiZRM5DjhD7SWd8ShFPf3m1yJecqN/1ITSw41fwFr7MgeDqi08556Yv3TNVn/tTybT2DCT5meFFi4q0O7Up1tM3SSO+FhpPsW0qFbcBY0pAltshJGK0NXRwcUYZEvFz31/5WkzViAk70sFYshFARV1TwoSJ3nAgut+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net; spf=pass smtp.mailfrom=mixaill.net; dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b=n3euNF1p; arc=none smtp.client-ip=144.76.234.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mixaill.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b="n3euNF1p"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A28F75FE93;
	Sun,  6 Jul 2025 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mixaill.net; s=dkim;
	t=1751820161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=8HmFOhwYChwnP9VZJIuH85GCPM2Sz9Uv7utYp1wqqdM=;
	b=n3euNF1p2xFtVB1iIfvEa3GghzxCjy766uzxOcHysq1WJVMsXWFb5aEHV6EvN/TnHtrdDF
	DL4We9rjoAxxdaPfR4/ymjg+U5NWWOJ3j2fhC/wyWcnuw82M8ACFLaOoCYUsSxg0XG9oxi
	QgE+sweX7BdJTbttDbguW+7utdMjSdiYkkpz1GkExuz5fdFmLJzoWs2FgkUZLtvKdm5wSI
	Hp/QoeHpTfwvo9iS+x/1cqocetwtcaFWY8O1KThMjkhqxkInGrGTlNSaFtkm6znKWhEZFg
	A5gFXT7tHXV5iiO9U6Y5Z8U21tlMnG5jQl9BuFcxy+PXSM5Cvc4LkYyfM3Y6yw==
Message-ID: <1ebe845b-322b-4929-9093-b41074e9e939@mixaill.net>
Date: Sun, 6 Jul 2025 19:42:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/rdrand: disable RDSEED on AMD Cyan Skillfish
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Rik van Riel <riel@surriel.com>
References: <20250524145319.209075-1-me@mixaill.net>
 <20250617200551.GIaFHKnyPV_XsSjlMP@fat_crate.local>
Content-Language: en-US
From: Mikhail Paulyshka <me@mixaill.net>
In-Reply-To: <20250617200551.GIaFHKnyPV_XsSjlMP@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 6/17/25 11:05 PM, Borislav Petkov wrote:
> Does this one work too?

It works, however, there is another issue with the BC250 that appeared 
since Linux 6.15.

Commit 4afeb0ed1753ebcad93ee3b45427ce85e9c8ec40 ( x86/mm: Enable 
broadcast TLB invalidation for multi-threaded processes)[1], merged in 
Linux 6.15-rc1, breaks the device — it starts to oops and panic under 
any load [2].

[1] 
https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?gid=0#gid=0
[2] https://mixaill.net/linux-kernel-lists/bc250_log_invlpgb-1.txt

Clearing the X86_FEATURE_INVLPGB cap helps and the device works normally 
again.

It would be great to have this change backported to 6.15 and 6.16 as the 
device is currently unstable with these kernels.

---
 From 064c91c5f3fc02a6eecd6b0b7cf074e2d0eb75aa Mon Sep 17 00:00:00 2001
From: Mikhail Paulyshka <me@mixaill.net>
Date: Sun, 6 Jul 2025 01:46:46 +0300
Subject: [PATCH 2/2] x86/cpu/amd: disable INVLPGB on AMD Cyan Skillfish

AMD Cyan Skillfish (Family 17h, Model 47h, Stepping 0h) has an issue that
causes system oopses and panics when performing TLB flush using INVLPGB.

Clearing the X86_FEATURE_INVLPGB flag restoring system stability.

Signed-off-by: Mikhail Paulyshka <me@mixaill.net>
---
  arch/x86/kernel/cpu/amd.c | 6 ++++++
  1 file changed, 6 insertions(+)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 21072f84071a..89b74203396e 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -935,6 +935,12 @@ static void init_amd_zen2(struct cpuinfo_x86 *c)
          msr_clear_bit(MSR_AMD64_CPUID_FN_7, 18);
          pr_emerg("RDSEED is not reliable on this platform; disabling.\n");
      }
+
+    /* Disable INVLPGB on AMD Cyan Skillfish because of an error */
+    if (c->x86_model == 0x47 && c->x86_stepping == 0x0) {
+        clear_cpu_cap(c, X86_FEATURE_INVLPGB);
+        pr_emerg("INVLPGB is not reliable on this platform; disabling.\n");
+    }
  }

  static void init_amd_zen3(struct cpuinfo_x86 *c)
-- 
2.50.0


