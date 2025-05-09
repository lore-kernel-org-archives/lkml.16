Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298E8296D03;
	Fri,  9 May 2025 13:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796705; cv=none; b=oxJHTVI/iAu0q2LaHhRlAXVhbKXPWMzNhIlJNC0849lCNbZWtv3linWSHqd41nUtj/nkM5Ztw25tye8g+g2SadLBhxcubScQaG+XBh4LO6Eoy0Vab8OYctrvPNHmbEE/WYSbZHQPW2md8Dbf7/ioN3zmv/hb2c6ix+IvmLMopLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796705; c=relaxed/simple;
	bh=sgUuawys4CVWd18cGnNmHCR+VHk9LnqU+20rIof8jPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVQ1ACZM33Xb+gLZ5NV3KrLePC8ewcY7evmpZl3llG2ddVOm4HK9b8envmswI5+rzZ6QybmtSf+Se3DZn5NUiCl1l4PGyVK9gtYQrGps1qfpvZCr1WMNHPIwQVsK0g+8BmSq4i7+uvXtp2dQEDTaluh6kqQ4bBc/WoTj3Nlpubw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhstrrLf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhstrrLf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0ebf39427so1333509f8f.3;
        Fri, 09 May 2025 06:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746796701; x=1747401501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6kFmlgqoPiMHx9iRiwRxPf9qHkMFcTzTxiQjceKAuI=;
        b=MhstrrLfVCeBMHAdsyK0a1k7uthaaQOLFpTGTOBmpJGYCyXoB5kK4KBjIeWrxNA0VI
         VCMQu1Z4pzuPHbmht894f3gkZtvlY+G8Kk0Bze8ueEywVtLRFAGnxdKKnSdh/gogPzmh
         N3lY9vQu/EwERB5TpEKIyKeDJ2htt0WxwnoVjujx+2rD7/rwPU7oHkg1yVtILhl2nyWO
         sOy0k0q12e1+Mygwa9mu13LG97oVRUqlAmDJADcSUk68OU6soh7sa1pCsHzJ5gh+7GOD
         qvmh340RPS49FrxRYPBsaBxdwVbGfJywA1SJ4okFpMSVFT0Iq+26kIvb0rKlozVeix0k
         Bmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796701; x=1747401501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6kFmlgqoPiMHx9iRiwRxPf9qHkMFcTzTxiQjceKAuI=;
        b=k5rEtNR2cnAOd4DB42DRDt3B7mWiuxNNDMHFMsdfonBjjwjwDf3BcJBkFwcZEH+hLg
         ioSV8KmjFyFmdgn6q6EHUOP1Kdnd5xKzHBamgpustrVPAf5AAqN2mJ6Sa0UVxFwH91Xt
         M57vO3BPAnU2tLc+3GEcY0rycgtPXcAU4xJpbXJQvxmaadfssDOZQRDS/A2v9V24tRTx
         cMSjBUQYQUqmObXPjHPVgCaDcY+j8/Dix/+5Qy633qEvU6QEda7I6lprBQVF2pRAaYUH
         XJcLXBiAbRvYWmWMb87uHPNIGsDprmj893cxP6w+AA4R+iUjgG8iij+mK/Hx07/o9zJu
         oNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR/vkw6StAAOTIVFg8a1rs9V9O6ogjv0IKxWphGW0R7UPrXmhAfzwNu+zi7uhaDB1t/mOCIowAuD9aYLw1oqkPQrE=@vger.kernel.org, AJvYcCXdFmBGWTSOJhR49V4WRn658jZRMfg05QDIRuUBKsTBJaAZ58aMhFFXHze14ryMxU7/QM8Xjm7U1j83/Jef@vger.kernel.org
X-Gm-Message-State: AOJu0YyI0Mt/zkC72wyMWpGQtTZaG1ElhYMmeGtnXQpWGY6z0GL3Rprf
	eETgiN6iexg4F+4DIyeTFhCdnK7r62PFAIH2f5DcLQrzY1Dyk/ia
X-Gm-Gg: ASbGncuubyJtbD7p9aA2xK37SG7kXKI37aCTUq2jK82NDYPr1Q0gJoECJeCjp4agiJG
	vuXX/niohOxDOiuegBL2n2yF+klaNB+QuM0TFJNPfN70ruWzVIYXLydignD83XhW7gqEYv1oz9R
	KsIie1d0J9Pj6eQDY9u9D1mAWLc3ijtlw5sXZIb6nxqf0SXJfrvlH19PUOF+hAtkB6Lj7SDuTsF
	26bIoJ2Tm9yW7C9ESIrYcIRUwPyOwBED0bJNPre06U1j1HcStfGLsFy2Flz6lnFL8Lj+YxP1vjT
	8rgqVF3ivFbzuqsnCEjzbd/0oDV0n10tzIQEwuT/NAXF61Y8
X-Google-Smtp-Source: AGHT+IGKuCHUteYYaaWgXJ0x6ii7m7FmxtGjV1AI/Suc2tv2PoC0iHGOic2BZRIQbQSqWmqYDWEbjA==
X-Received: by 2002:adf:e105:0:b0:39c:30d9:3b5c with SMTP id ffacd0b85a97d-3a1f649a919mr2476134f8f.39.1746796701118;
        Fri, 09 May 2025 06:18:21 -0700 (PDT)
Received: from [10.14.0.2] ([178.239.163.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2a12sm3194434f8f.44.2025.05.09.06.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:18:20 -0700 (PDT)
Message-ID: <6191c255-84cc-4721-91d1-1884472989f7@gmail.com>
Date: Fri, 9 May 2025 15:18:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
To: Theodore Ts'o <tytso@mit.edu>, Dmitry Vyukov <dvyukov@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org,
 linux-cve-announce@vger.kernel.org, linux-kernel@vger.kernel.org
References: <2025040820-REJECTED-6695@gregkh>
 <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh>
 <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh>
 <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
 <20250509121036.GA92783@mit.edu>
Content-Language: en-US
From: Attila Szasz <szasza.contact@gmail.com>
In-Reply-To: <20250509121036.GA92783@mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > I would invite that security researchers
> file CVE's with the *product* as opposed to the upstream open source
> project.

The CVE was originally filed for Ubuntu Linux ;)
Namely, cpe:2.3:o:canonical:ubuntu_linux.

It was moved to kernel.org CNA territory due to some politics,
then it was rejected on the same day the bug was fixed upstream.

Since then, I saw Canonical folks mention that they wanted to
allocate a new one but needed to obfuscate the description so it no
longer sounds like a kernel bug.

Which, incidentally, is not quite true either, it *is* a kernel bug.

Since then I checked, and 5.4 LTS (any<=5.6) had been vulnerable without
the need to ever mount an untrusted/malformed FS just by systematically
corrupting a vanilla fs's B-trees with normal operations.
       

There was also a logic issue I wrote about that hasn't been
patched, since hfs_brec_find() can return with -ENOENT, and
hfsplus_create_attr did not treat ENOENT as a problem when
inserting records, resulting in a flow completely missing the
only boundary checks that were present earlier. With the issue
that commit 25efb2f patched upstream and another issue I found,
the condition for the rejection is no longer true.
The image to begin with is not even corrupt.

According to this, https://lwn.net/Articles/652468/, user namespace
mounting for block filesystems *was seriously considered*
at some point, but it was deemed too hard or costly.
But ok, so it is "doable" in theory.

Then, it is just not consistent with the rest of your CNA practices to
blame users for relaxing requirements on mounting, and as this shows,
this was not even the case here for one of the LTS stables.

I think the delegated threat model is a difficult one, but you kind of
chose this yourselves with the CNA policy of treating most bugs as
potentially exploitable.


> If companies want to assign me a chunk of headcount (say, 4 or 5 L4's
> and L5's for 3 years working on thing but ext4 hardening, plus a
> full-time L5 after that working exclusively to maintain the ext4
> hardening featuers and fix random syzbot complaints), I know what I
> could assign them to change the security assumptions that we have for
> ext4.  It might require a
> CONFIG_EXT4_SECURITY_IS_MORE_IMPORTANT_THAN_PERFORMANCE parameter to
> enable all of the hardening features, but it is doable.

> But they aren't, so I consider it to be *obivous* that the industry
> doesn't think is important --- just as Orange Book A1 certified OS's
> was a total, complete, and abject commercial failure.  And note, we
> don't assign CVE's based on the fact that se all OS's violate the
> security trust model of Orange Book's A1.  :-)

No, you (or more like cve@) assign CVEs on panic_on_warn noise instead:)

On 5/9/25 14:10, Theodore Ts'o wrote:
> On Fri, May 09, 2025 at 10:03:13AM +0200, Dmitry Vyukov wrote:
>> If we can't prove it does not have security impact in any context,
>> then the safe default would be to say it's unsafe.
> In that case *anything* could be unsafe.  You could have a context
> where (a) you aren't using secure boot, (b) /dev/mem is enabled, (c)
> /dev/mem is world writeable, etc.  In which case the mere existence of
> /bin/bash would be "unsafe".  Yes, this is uncreasonable and unsane.
> But that's because the "no security impact in any context" standard is
> insane.
>
> As far as many file system authors are concerned allowing automount by
> defaullt is insane, and is apparently the fault of some Red Hat
> product manager many years ago.
>
> E2fsprogs and xfsprogs now ship with a udev rule which disables
> automount by default.  If applied, mounting a maliciously fuzzed file
> system requires root privileges.
>
> Of course, distributions are free to change the default, just as they
> are free to ship a system where root has a default password of
> "password" or /bin/bash is setuid root.  It would be insane, but
> product managers often do insane things in the name of user
> convenience.  In those cases, I would invite that security researchers
> file CVE's with the *product* as opposed to the upstream open source
> project.
>
> If companies want to assign me a chunk of headcount (say, 4 or 5 L4's
> and L5's for 3 years working on thing but ext4 hardening, plus a
> full-time L5 after that working exclusively to maintain the ext4
> hardening featuers and fix random syzbot complaints), I know what I
> could assign them to change the security assumptions that we have for
> ext4.  It might require a
> CONFIG_EXT4_SECURITY_IS_MORE_IMPORTANT_THAN_PERFORMANCE parameter to
> enable all of the hardening features, but it is doable.
>
> But they aren't, so I consider it to be *obivous* that the industry
> doesn't think is important --- just as Orange Book A1 certified OS's
> was a total, complete, and abject commercial failure.  And note, we
> don't assign CVE's based on the fact that se all OS's violate the
> security trust model of Orange Book's A1.  :-)
>
> 						- Ted
>
