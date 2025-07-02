Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A282FD58F;
	Wed,  2 Jul 2025 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470380; cv=none; b=I9MzhQKGMnzBO+2ziJHknBSnjJjA+xDlbfbR+Ki49M8sh+3nKQbBkxkTZH41xXOyjE3SPSwTKtvIpsd7r0Tdd61F7FyMdc+hYJXpNN0e7m/VWNV+WWw0Rwv1uZtvk6e81rsLKvv/Te1/NrmbK2/JRDV+vsCq+1xcyY3TsgwiwWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470380; c=relaxed/simple;
	bh=LDn2AqJEY5N2KJ57SfDAnTYINdlraVlvv2jEUoRc1DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWZl8TrCykbbgrxBmmlMF0pivweAY/W1dCiUN8zHDlXsK1nJR5YCFkGpSVX9Zfqm0dYkvp0swNs4E6tQaQXFcewSoPWIAQ6BtdMH3dYQNryR/ebyAhiTlXIIvmRIrzQEUtf/6dOnrOsiEixRu3/1DKuCfuxA1UnNS8UaF0OTfFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l34c7DPZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l34c7DPZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450828af36aso2551925e9.1;
        Wed, 02 Jul 2025 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751470377; x=1752075177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZleJRf5RL+v6aSyfU03OLzhGc/iTMC1s/D6/TYQvV8=;
        b=l34c7DPZza8g/H5kGSjna/chlKlTcPU+8s+FipFXCQ7yqsWhFgHUuEm65TF0nGpSoC
         ck6DTxCVAG9ADMR+cPWsNeR8OMPt24u7n7ic31vIRB+VDpkUdhZSqUVw+odigMy/u+PQ
         /z87tL9wRt0OsX+EDhgHonHX03UmJckmdAr8OSSA0H3X8Rm1lPhQjVIZaNJ0MwWcQnBF
         8BbMSmJ8cKeCESw9NYfVM3M4FWLRF6OyZjUh5iZ/rsUo1thJpGIbW9E42tvxgmXeJ5hM
         zBh/ZS0bDn/H9qlc9lEAOzspDJxdS8M+4Z7r65A6j2J4jPooIYledtiwaVQ+mphk8ZdX
         tboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470377; x=1752075177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZleJRf5RL+v6aSyfU03OLzhGc/iTMC1s/D6/TYQvV8=;
        b=mVGh/CIRoNruutuK873dE1PtajwKOV3FznJ8ApI3McU1UmA4Zs5n9hY5v0ZNOdze1I
         RhhArzfxX3LRluCmCJZCx0zNjGl4Uzd2ElIkCq/CKRJJtJz7TVmZO6peBkaPl2aWFCdA
         otdNIVD0eNRfgXWv8PyL2dHTw8q6wF3K7I4o8yUCinu4FJF+gDkOelhiJpmIkwZwGpMK
         7du8ko4CldTknbRbfMIQX+zZnVaeVYsYRiR87GRKT5bSGAE/MdDNJm3RoyP49p7Lb5Uh
         LR7ctdwBC1PxCPj5reW1+UQwf17l31XvrmMsvfkIzBOKB03TGbDnbdbbkI03fAtrkwvE
         8UuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0HHtnYtefu+ov4s/IaegdprJwTjUKZlK95ktuymV5rkV1yONF0zvkqUstYiwnn7FAOaTsVb0kTdo=@vger.kernel.org, AJvYcCWHQxamImwFeywcIYS/6h86q6V/ZdRYVjoQTOna5N2v57J3xVwCntC7T5FsbkhdfIt93ljV7yMwy/UjRzG+@vger.kernel.org
X-Gm-Message-State: AOJu0YzAdkSCDb+fw/UMu8QkphIiK1Ozl1VC+E7/64uSKzYuQ4o2lFRS
	VItPez21xgpidSnHkBv6QO/Eo+aLmMgT6lmq5RmkOA3Po9epLX2rlvI=
X-Gm-Gg: ASbGncvBlmNUoiq093Ytme/omdr8gKcPyACyh3JVJd4WR8ZSDx0itZr8LKcqysou2h1
	Cepd0BUf1TenCLIQV2vYQzL1hFKWmcKB43pNiEFDhJtKxb3VT7vvTfviVNptC+uvonmpE7XMTuS
	pAxuWRIMcBO87oZWElNOrwIGGjKs8tL5sJQsRLo4CfcATMCp06NR3cMTqS6hCmA7Kpg2gb2uRIW
	flKxT/HzHsVVkh6IM9vNGd2xpCMs5FHqu75G/c6VtPqkP87mGgo4YIo3r9G/LuH0L2FizuCR4An
	gaw1WWIKy2PuExODsoTHTMfwe/Hg0Yi/DBd6g6hffB8Wlke6wX43RDZcbbF+Xv39MKL8KhBQC83
	vug1cHTnjrgbInsvMQsGpW/JGiQ==
X-Google-Smtp-Source: AGHT+IHaQbogFU3g7rZ9zyrbww17cgDVv+9tBrm91hDtbaYKc8Y9ausCHDwiYbYKoFeazI9fs8cMFQ==
X-Received: by 2002:a05:600c:1c1f:b0:453:7011:fce3 with SMTP id 5b1f17b1804b1-454a370cdacmr15831705e9.5.1751470376728;
        Wed, 02 Jul 2025 08:32:56 -0700 (PDT)
Received: from localhost (148.red-80-39-52.staticip.rima-tde.net. [80.39.52.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fadf3sm16634440f8f.34.2025.07.02.08.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:32:56 -0700 (PDT)
Message-ID: <02ffd0a2-3036-475c-9e23-55d706eec7ea@gmail.com>
Date: Wed, 2 Jul 2025 17:32:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: standardize git.kernel.org URLs
To: Jonathan Corbet <corbet@lwn.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DOC ML <linux-doc@vger.kernel.org>, KERNEL ML <linux-kernel@vger.kernel.org>
References: <20250625142017.237949-1-xose.vazquez@gmail.com>
 <87a55vag0l.fsf@trenco.lwn.net>
Content-Language: en-US, en-GB, es-ES
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
In-Reply-To: <87a55vag0l.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/25 7:27 PM, Jonathan Corbet wrote:

> Xose Vazquez Perez <xose.vazquez@gmail.com> writes:
> 
>> replace https: with git:, delete trailing /, and identify repos as "git"
>>
>> Cc: Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: DOC ML <linux-doc@vger.kernel.org> (open list:DOCUMENTATION)
>> Cc: KERNEL ML <linux-kernel@vger.kernel.org> (open list)
>> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
>> ---
>>   MAINTAINERS | 50 +++++++++++++++++++++++++-------------------------
>>   1 file changed, 25 insertions(+), 25 deletions(-)

> So ... we're changing GitHub URLs from git: to https:, and Gitlab URLs
> from https: to git:?
> 
> Certainly we want to fix URLs that are broken, but is there any real
> reason to churn up the MAINTAINERS file to "fix" URLs that work?

The reason was to be *consistent* with the rest of the entries.
Because most of them(380) are using git:, vs 22 for https:

$ grep git.kernel.org MAINTAINERS | sed 's#://#:// #' | awk '{print $3}' | sort | uniq -c | sort -n
       1 git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git
      22 https://
     380 git://

But Greg has some concerns about this protocol:
https://lore.kernel.org/lkml/2025062654-lubricant-lettuce-3405@gregkh/
"This bypasses the mirror systems in place with the https: protocol,
please do not do this without a lot of justification and agreement of
the hosting providers involved as they will have a large increase in
resources if this were to change."

So, the right patch should replace git://git.kernel.org with https://git.kernel.org in all the tree.
$ git grep -l "git://git.kernel.org"
Documentation/admin-guide/LSM/apparmor.rst
Documentation/admin-guide/kdump/kdump.rst
Documentation/admin-guide/reporting-issues.rst
Documentation/admin-guide/workload-tracing.rst
Documentation/arch/arm/keystone/knav-qmss.rst
Documentation/dev-tools/sparse.rst
Documentation/filesystems/bcachefs/SubmittingPatches.rst
Documentation/filesystems/erofs.rst
Documentation/filesystems/f2fs.rst
Documentation/maintainer/pull-requests.rst
Documentation/mm/hwpoison.rst
Documentation/process/adding-syscalls.rst
Documentation/process/maintainer-kvm-x86.rst
Documentation/process/submitting-patches.rst
Documentation/sound/hd-audio/notes.rst
Documentation/timers/no_hz.rst
Documentation/translations/it_IT/process/adding-syscalls.rst
Documentation/translations/it_IT/process/submitting-patches.rst
Documentation/translations/sp_SP/process/adding-syscalls.rst
Documentation/translations/sp_SP/process/maintainer-kvm-x86.rst
Documentation/translations/sp_SP/process/submitting-patches.rst
Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
Documentation/translations/zh_CN/dev-tools/sparse.rst
Documentation/translations/zh_CN/how-to.rst
Documentation/translations/zh_CN/maintainer/pull-requests.rst
Documentation/translations/zh_CN/mm/hwpoison.rst
Documentation/translations/zh_CN/process/submitting-patches.rst
Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
Documentation/translations/zh_TW/dev-tools/sparse.rst
Documentation/translations/zh_TW/process/submitting-patches.rst
MAINTAINERS
drivers/net/wireless/intel/iwlwifi/iwl-drv.c
scripts/get_maintainer.pl
scripts/package/debian/copyright
tools/tracing/rtla/README.txt
tools/usb/usbip/src/usbip.c
tools/verification/rv/README.txt
