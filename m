Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7AF2D541E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749758758; cv=none; b=ktGQSrzFQStuUcq+hb8IrTI4F7yYFUE0eIjvCJEsMEz1E1H0tYLr/eFKf1qtWpqeQ9YdZycfAn6+JEvFyfiI2W3DR8iuKBOOYdOUcsAm61JBugtJOi1yZ0cXseZkxYyAVfxC50Xvrb8dY9Hfox7AwtvpBHH6N0cUsuM4qywo+NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749758758; c=relaxed/simple;
	bh=Re2CW7co8R/M5Q8rcFGXf3tlF1UXLdad4cNsqa8bUlE=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=Yauv+BrFYGkBXE89iwDyEeaG0w4ukI8kRy2qBhCjCOUAjhsyL89qcf6wKGn+B+MJysP8c6CgtTSkfvGYZ8QhmAYEiTAzZnYpUaVYEY00LBgA52eklILryaYIgkijzAMUbP2wkwuvdw5prnFSVbFTlf1hX0SRFCZZrdIKPZoqEhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=SuEck5h2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="SuEck5h2"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7486ca9d396so1072210b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749758756; x=1750363556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=af51BBEYY6aGbebFxLHnn8CgVDycQQJsTeT80Jnf6RE=;
        b=SuEck5h23rl7A5mmW4xg7DLt2XBObgIo3T382/kq7tOIlySjncTfm8aFMBmKDM4plj
         O5988OetrYvtpdzphTccnjwX727gzen3anbo64aq1r9rwH9dXW5lp2U3qErGYtgsA2FR
         fJnuilMynnhg3ctpKYGVWrhWSgI5BDZOjpPQQF4OzDUNvSchDUWRAf1dAsuet2OTu2A0
         ZT3jdEbvOYzguvlnG+2O0XfnvjfdKMDPxRr28SAzMw+tAHf6SEAVBv6HMDL3t/V5Dyij
         01EHMRJPoN8vIcnGQHavsw5uAxG0fdUKYV5YE0jvTuqGeIBqdg+/RATirgUonqK3ojn4
         K0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749758756; x=1750363556;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af51BBEYY6aGbebFxLHnn8CgVDycQQJsTeT80Jnf6RE=;
        b=cCzBhNFB+e2C0LfScZwm6KF3oIs5rUnBr/u1H2jK7PkKqKosrUJj0L6prB6p64ft6g
         Gk7voEUyWRm6w3Dg+rNFRMomBxGH4Gu7bxoAxnxfZ2AzLdedLeJ/qH+ITknnmx2y/q3p
         Ttdia8yd38Nkg8dxEkJBZX8MUjbbgxtDZpQuvGkZf5kMZqdIbPteoZllEDCgcjpUy9T8
         NYZ4FE77ZcA5rkTocEVmxgRab85VurEzwMVCq8bihadXG9jD8paKIp30ipCDXXRIZGpD
         RJ/Yopwp99/FGkhAYbal8LQgxsyMzpsKWu7lVHMpZ110PFlfgj/xaKcHqguPWUVvEtes
         OBLg==
X-Forwarded-Encrypted: i=1; AJvYcCWMGbuaP/QvbfWUT2sG2WkUsvz5upSmoQehOZaLziAFbeIoPTdzedMOYmIPcmNEIJCSDh9Ez/HxyBilz+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpZpSGc40TqShN+Df4meisXQdR/6KHKO23X6ezO9zvITkpQZ7
	wdeh7W4HMZ/5yc531K0HdTVEMdLTkX1HCRjV0djhgqG8EIw428cohghKkNIUQ6kzpO8=
X-Gm-Gg: ASbGnct8aciiPi++8p6dDAUQeU3cZznBpLChBCnvCVuv1UlD6rokL+60k1+GylQE0A2
	u3eu3m+ucmQR3sesDgxn8wNyHPqAL/m5RmaNRw2lIha85bJKEQcQzlH4Y9ST/qyKcZgWsYjHerK
	SWTF7tx2iuqJLEeDSlj2/HgQT9dwkTn2fOhTyqZ1ss2ubrdzyy3061yM6JuKCxmszR4KjXuWg63
	ECl7Zd266Av/GsV+3BGf7NLXSFBcUFC+WgAy4c4336vi5/t7H4QGrbI5dQG9T/kRh+g1xwUF2aO
	Ek2b5G3Tb7fGa2ICJFN2ATJXIGMzay5G7Qpw8j8RFu4I1EniOrJx+Y+z1/nGYS3vaj9WE7Q=
X-Google-Smtp-Source: AGHT+IH2RoHWF8PmxJBIXY2wg5rdTqPBQh+vVExjeVE43egm/MogvtvtIhJaxeSLVjk+Z689LqbYIQ==
X-Received: by 2002:a05:6300:8a05:b0:21f:5adb:52c4 with SMTP id adf61e73a8af0-21fad02d0c2mr253713637.30.1749758755672;
        Thu, 12 Jun 2025 13:05:55 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748900063f6sm140856b3a.64.2025.06.12.13.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:05:55 -0700 (PDT)
Date: Thu, 12 Jun 2025 13:05:55 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 13:05:52 PDT (-0700)
Subject:     Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
In-Reply-To: <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>
CC: thomas.weissschuh@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-4BA05CCD-6D5A-4067-B88A-DEBD4FCDED77@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 12 Jun 2025 01:31:20 PDT (-0700), Alexandre Ghiti wrote:
> Hi Thomas,
>
> On 6/11/25 11:22, Thomas Weißschuh wrote:
>> All vDSO code needs to be completely position independent.
>> Symbol references are marked as hidden so the compiler emits
>> PC-relative relocations. However there are cases where the compiler may
>> still emit absolute relocations, as they are valid in regular PIC DSO code.
>> These would be resolved by the linker and will break at runtime.
>> This has been observed on arm64 under some circumstances, see
>> commit 0c314cda9325 ("arm64: vdso: Work around invalid absolute relocations from GCC")
>>
>> Introduce a build-time check for absolute relocations.
>> The check is done on the object files as the relocations will not exist
>> anymore in the final DSO. As there is no extension point for the
>> compilation of each object file, perform the validation in vdso_check.
>>
>> Debug information can contain legal absolute relocations and readelf can
>> not print relocations from the .text section only. Make use of the fact
>> that all global vDSO symbols follow the naming pattern "vdso_u_".
>>
>> Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
>> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002
>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>> ---
>>   lib/vdso/Makefile.include | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
>> index cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adbb68497181085752f8 100644
>> --- a/lib/vdso/Makefile.include
>> +++ b/lib/vdso/Makefile.include
>> @@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrand
>>   #
>>   # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
>>   # dynamic relocations, ignore R_*_NONE.
>> +#
>> +# Also validate that no absolute relocations against global symbols are present
>> +# in the object files.
>>   quiet_cmd_vdso_check = VDSOCHK $@
>>         cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
>>   		       then (echo >&2 "$@: dynamic relocations are not supported"; \
>> +			     rm -f $@; /bin/false); fi && \
>> +		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS.*vdso_u_"; \
>
>
> This only works for arm64 relocations right? I can't find any *ABS*
> relocations in riscv elf abi
> (https://github.com/riscv-non-isa/riscv-elf-psabi-doc/releases/tag/v1.0).

That's because the psABI people do not believe in absolute symbols.  
They exist in the actual toolchains, though, as they are part of the 
generic ELF ABI.  In theory they'd work fine in the VDSO as long as 
we're using absolute addressing instructions for them, which is 
possible to do (and I think should happen for some global symbols).

That said, it doesn't really seem worth the effort to get the checking 
more fine-grained here.  I don't see any reason we'd need an absolute 
symbol in the VDSO, so unil someone has one we might as well just forbid 
them entirely.

Some old toolchains had an absolute "__gloabl_pointer$" floating around 
some of the CRT files, so we might trip over bugs here.  I think we're 
safe as those shouldn't show up in the VDSO, but not 100% sure.  
Probably best to get this on next to bake for a bit, just to make sure 
we're not trippig anyone up.

> Thanks,
>
> Alex
>
>
>> +		       then (echo >&2 "$@: absolute relocations are not supported"; \
>>   			     rm -f $@; /bin/false); fi
>>
