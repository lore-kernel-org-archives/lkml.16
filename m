Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E161F582C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038853; cv=none; b=KdvIc4WpaWz0B0YqgTfY4miTf5qnUHUXw/EvTeNJ3fX6aWGSW7B3nQRhMbBday/Z57PdFhydMYVre6RNYY6XJ0Lr4dFZYhAcc68IKoJ66pZMY+aQCPcL0tOZ/+P09Q/fVsuTVnZt9bNOb3+SQwKSpUuVUM+e8oOSUkQT2z4lS5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038853; c=relaxed/simple;
	bh=VRb1hLaWt2WaPvMOGkwBaKEZsdN5qjvLhw2FlIjd7v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjC7pnj0pp/4WTXLdMrOkzaTx1pJm3JKkJTpTShe1uk7EwlcwZEmQ2ILrCgVAeIpp5e3DjHAJBYViqSQk1K1hnkJu6I7mASCS8q6HrYpXxMmVkSR/E3+b+SJ8cPl4EoPxvqpqIyhrZL068hjHa9oDMn81WVt1RZvlBdiegIHLaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgG9Ep/n; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgG9Ep/n"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af51e820336so4185570a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744038851; x=1744643651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJcQMlxagZdmN1tNEb0GJjXz4sD05V5goeJcE+Q67Ew=;
        b=AgG9Ep/nZhDeG0FQpNQI1vnDL4YWkmAeNiACvm5Cu0sUKyDg1EOzg4ijO23xJVtyjC
         ylb6BvQQgJWqRWafcmq+NLcElqGk7toktGIAtXFBl8l1Q0AKScd99QDCjbRA+QMNjgZS
         4Y+ob6ir8t522gESd2rXy8tqlrUPyquoROTCwYw1q3SmIWTKhDRm6phNcRQnIu6ELHLQ
         MeEoOZeCKBcv/ClR4dZ1z8wkGHZYMjFVgMKJWrulJJ2dwiz13cA6NhXQTB/iEOI4eQGe
         8w6rdxIwrZ6L8LX93X9BSEMGSsEzHfxxU7hkz2hZi3TFh1bZnoBluDuWnc6+pm4Nj6NV
         P6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744038851; x=1744643651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJcQMlxagZdmN1tNEb0GJjXz4sD05V5goeJcE+Q67Ew=;
        b=KaSDKm4C1beU4lRRjqU1eRt0MbK9QEr3srdqm4HVSzTEN9tyAYf30xnhqF7VYKk1hE
         CRcZ7I5VMyiTQ59tSneZIWT81o6OGm2MGDcRJyhrFaYsMt+zQf6oMmlo+IRwAWbBzjcB
         OnFjPW7vcIVouvbpq8FygwEnodGdtq2gVZIUXziXewVLYX72agYkOB4jn90vPbu65DX7
         wm3u8A1BYb3djoC4VOITs7axWlf3VJWaaIVBNOtOScIK4opnEOC/h22855a8LHLXK17c
         Lo2B0A/SD/+YSlqGwx6Xw0/9iE7mkEWnzKo0diL32OtcOQN2zjvYuPNQw+5H0ZFZfPPO
         Y7/w==
X-Gm-Message-State: AOJu0YzgwXLT4lR4IYqMidyTM3eskdrtZSwC5LZ5hnSfVqOZZKTdBqJT
	QAMwxs90n5bfacywz8H3f7feJzmHcC5xbi5vmJnrjQDFEPztNolYIwXWTQ==
X-Gm-Gg: ASbGncudh8lvEPTy1ziErF3LDNSkUKqf/w1Hm4BMO1cJkSz2xln4uKRk5akDo9HfsAg
	kZN5Fzk+WX9JuenvXGD55yvAmjMHmxLHucI0fzF0sItJdjVYs/YF4OGdWTipj8xbCV1mXY2irlF
	wfT9JWeWgUXXQa81k63H1MYmtX0+0NS9RW9eZes4mTfAxZqdgnnG57KF58a8yYUQSN0/vDYEADx
	MVxQbraqzAqft5+4xNolQS9B9bcUWFHnBpd88iPcpHOQ2/CGAz2vtpzUJYrDs9xhhwgEcpg1aRw
	5h+pv3TnyCvBfBF7PoAm7MAdBLftGTl/KZckk+eQyr6OQ9JrqvbOYsL6Ig==
X-Google-Smtp-Source: AGHT+IGz4bT2DSQAveyWtbRMYccxore0huJtq8sc+JCHUUh2qKm++8SerbdE3mJlAYoSxmb/QDxT0g==
X-Received: by 2002:a17:90b:3503:b0:2ee:5958:828 with SMTP id 98e67ed59e1d1-306af7303c1mr14402094a91.9.1744038850955;
        Mon, 07 Apr 2025 08:14:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca47f57sm10257350a91.11.2025.04.07.08.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:14:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Apr 2025 08:14:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Linux 6.15-rc1
Message-ID: <75ec6d07-24f3-47b1-9632-ff53ef12c1ab@roeck-us.net>
References: <CAHk-=wgv_rS5dT8QY7Yh3V5UGup4BLHYToXNKWoH3C9+3YhY9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgv_rS5dT8QY7Yh3V5UGup4BLHYToXNKWoH3C9+3YhY9w@mail.gmail.com>

On Sun, Apr 06, 2025 at 01:32:47PM -0700, Linus Torvalds wrote:
> It's been two weeks, and the merge window is now over.
> 
> As expected, this was one of the bigger merge windows, almost
> certainly just because we had some pent-up development due to the
> previous releases being impacted by the holiday season.
> 

Build results:
	total: 161 pass: 155 fail: 6
Failed builds:
	alpha:allmodconfig
	csky:allmodconfig
	openrisc:allmodconfig
	parisc:allmodconfig
	x86_64:allyesconfig
	xtensa:allmodconfig
Qemu test results:
	total: 634 pass: 625 fail: 9
Failed tests:
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:ext2
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:erofs
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:f2fs
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:ext2
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:erofs
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:f2fs
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:btrfs
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:cd
	xtensa:de212:kc705-nommu:nommu_kc705_defconfig
Unit test results:
	pass: 595857 fail: 0

Most (but not all) of the problems have been reported, and fixes are
pending.

Build failures:

In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/utils.c:18:
drivers/net/wireless/intel/iwlwifi/mld/tests/../iface.h:169:5: warning: "CONFIG_PM_SLEEP" is not defined, evaluates to 0 [-Wundef]
  169 | #if CONFIG_PM_SLEEP

drivers/net/wireless/intel/iwlwifi/mld/mac80211.c: In function 'iwl_mld_mac80211_start':
drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:504:20: warning: 'ret' is used uninitialized [-Wuninitialized]
  504 |         if (!in_d3 || ret) {

drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1982:12: error: 'iwl_mld_resume' defined but not used [-Werror=unused-function]
 1982 | static int iwl_mld_resume(struct ieee80211_hw *hw)
      |            ^~~~~~~~~~~~~~

drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1960:1: error: 'iwl_mld_suspend' defined but not used [-Werror=unused-function]
 1960 | iwl_mld_suspend(struct ieee80211_hw *hw, struct cfg80211_wowlan *wowlan)
      | ^~~~~~~~~~~~~~~

drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1946:13: error: 'iwl_mld_set_wakeup' defined but not used [-Werror=unused-function]
 1946 | static void iwl_mld_set_wakeup(struct ieee80211_hw *hw, bool enabled)
      |             ^~~~~~~~~~~~~~~~~~

Triggered by commit d1e879ec600f9 ("wifi: iwlwifi: add iwlmld sub-driver").
The code was not build tested with CONFIG_PM disabled.

Building x86_64:allyesconfig ... failed
--------------
Error log:
x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE

No idea what to do here. Increase KERNEL_IMAGE_SIZE ? Disable some options ?

Building xtensa:allmodconfig ... failed

ERROR: modpost: "__divdi3" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!

Commit 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
didn't watch out for 64-bit divide operations.

Building xtensa:de212:kc705-nommu:nommu_kc705_defconfig ... failed
------------
Error log:
kernel/trace/trace.o:(.init.literal+0x250): undefined reference to `get_vm_area'

get_vm_area() is undefined for non-mmu buids. Triggered by commit 394f3f02de53
("tracing: Use vmap_page_range() to map memmap ring buffer").

====================
Runtime failures:

mipsel64:boston:
	Triggered by "PCI: Perform reset_resource() and build fail list in sync"
	and "PCI: Rework optional resource handling" which don't take particulars
	of that platform into account.
