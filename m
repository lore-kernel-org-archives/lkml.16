Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FDA154BF5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 06:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745045190; cv=none; b=MaDLoBYKc+VUtYWigofD/znr/5XXjjr0gLZ2Qj2L6xhS43zvx0MepkTdQvqHTXwjNLxn5MVuJuNl3WxChVO+gdrAn1tEWRQp0J8XOKdTRr14DpP9PFWZslSvn7qxO7xnmM1Z0fmyVrFxVyCiyxn6xQFHz3LJnFR4aCg4AzADwKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745045190; c=relaxed/simple;
	bh=iDl5B1v5FJYHXZlOgXY0HpWkdqy9oyaPAFwJEp09aoY=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=K0JUdou5t0Yb6jORFvHr/bEG8lmypYLoYXIB3X+aHYhgJ77PEznPuLyn1WdCG1PmM2KgHBske1nltplhG8gldkXFWhPacrUxzhFGLXRhUyi90QGgUCXHaIvUqco6w9ukZt8JuyVrYtse1E09eCqhluSSr9pkxtnY/rwLxf+L3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QLEo5SIX; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QLEo5SIX"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c47631b4cso1620191a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745045188; x=1745649988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgGfe7pfQEKHXwAsiL/+C2u2L63eEHqUtK4c7n9+Ets=;
        b=QLEo5SIXilCoCEovGqSowkRjVYFT17/zNnr+HXZx+YsaTcXUqxWg7ZiAc3hICTJ6dJ
         3XHSf1+kK9YJUjUpuF7gy7BDQ+SGyZKcDoogpJODgQqUFuFskjsW0SyW8p6tfylrKJc1
         0oRPGacydthekoRnAmnzZ017bk6Z7nv7uQ0j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745045188; x=1745649988;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AgGfe7pfQEKHXwAsiL/+C2u2L63eEHqUtK4c7n9+Ets=;
        b=e4VRuicbHMbqRy1i6lL1yeFPbYKZ7OIYiM3BaTwv8VIDDsBPg19EkXGT4QnIKTokTe
         j6cJdxOtvbWG2u7rMRU3cO052TbfvAlanZx2+trzk/IIIhkpMEiruhE47wF8N3Tj+qY5
         vEXgqcic2+392Ury88ORx+Y3sdAq5GpcL3l3R8WT5YBv0xftd4AhdXdTUMpY9et8FKBg
         hfqahiUGah/26RakQSbd/RgGxG/N7SS8zOe0YTtOTwrlaGEHA5SlOc+UD3JTGWKblSEl
         j3f9cBw4VjMcRzGgSTeXxmMJuBQvVbADc5kVYkdZ9SIL9+Y9dVL8pt1Bdp/7bsxmuPuf
         9/jg==
X-Forwarded-Encrypted: i=1; AJvYcCX3atWMvfqHNBy7qwJFLCJmgEj8U+uH2E1a8uCdO0bwqF59Gqp7VR4dep8CtRd6ZGwyqCBm+hdeGro4NLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS3FvXuN8lMP/HxOVpELqoI2kwnODKdO29mgEfW9+mz2vKDLBg
	pXpbqalMA1IUIoPXfSncTJeDnc8+Krq4Enfs6u47pLZ/R05gENE53rheRNJlYg==
X-Gm-Gg: ASbGncvMUXg1FSRpZ3fQIL0m+1ScSPMTsJePG9XE+V+EemyNzjwEkwsKfRH433Gf0IC
	jGyd8FlJ5A0WVJ9HCPTuvvOlWtDiMHPE7XcG7TZcAb0mtPEPRHEfiLtiL8BDgA4UK79eFhKZ3mY
	6xbHr+YupmUhxoioFZMfmpcJdGfSKzFaIyVg3VPpvCNsJTvd5eCKzqJa+CziQWOJKt9kKR9o97H
	IFoOPCA2jfZroWK4bPN4x+AeXy4pkf0Gy9U+KVnoL629MTs+L8Y0SLywoqhvAIVAO5cm5Yabwnv
	PGPdBIYwuWMsLTMcjj4amtwkeAZuPNXylxu6CUNXPX16YIabT76FtC/RvOO8mpvPrqOVnuYtesT
	AJXc=
X-Google-Smtp-Source: AGHT+IEGUlFLW66ijvjDAdwIEjVLrDZHsPSRPo1a//tFPGyZK0o6IG8RL1FLXXN9Ju9SX94gEV6kLg==
X-Received: by 2002:a05:6830:6687:b0:72a:1d2a:4acf with SMTP id 46e09a7af769-730062fbcc4mr2693431a34.17.1745045187657;
        Fri, 18 Apr 2025 23:46:27 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7300478ed86sm621952a34.11.2025.04.18.23.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 23:46:26 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Wentao Liang <vulab@iscas.ac.cn>, <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Sat, 19 Apr 2025 08:46:20 +0200
Message-ID: <1964ccc4e60.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250415122001.3325-1-vulab@iscas.ac.cn>
References: <20250415122001.3325-1-vulab@iscas.ac.cn>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH v4] brcm80211: fmac: Add error log in brcmf_usb_dl_cmd()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 15, 2025 2:21:37 PM Wentao Liang <vulab@iscas.ac.cn> wrote:

> In brcmf_usb_dl_cmd(), the error logging is not enough to describe
> the error state. And some caller of the brcmf_usb_dl_cmd() does not
> handle its error. An error log in brcmf_usb_dl_cmd() is needed to
> prevent silent failure.
>
> Add error handling in brcmf_usb_dl_cmd() to log the command id and
> error code in the brcmf_usb_dl_cmd() fails. In this way, every
> invocation of the function logs a message upon failure.
>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> v4: Fix spelling problem.
> v3: Change patch name and comment. Move error log into brcmf_usb_dl_cmd().
> v2: Remove redundant bailing out code.
>
> .../wireless/broadcom/brcm80211/brcmfmac/usb.c   | 16 ++++++++++++----
> 1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> index d06c724f63d9..a11a6d9f3c2b 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> @@ -744,12 +744,16 @@ static int brcmf_usb_dl_cmd(struct brcmf_usbdev_info 
> *devinfo, u8 cmd,
> char *tmpbuf;
> u16 size;
>
> - if ((!devinfo) || (devinfo->ctl_urb == NULL))
> - return -EINVAL;
> + if (!devinfo || !devinfo->ctl_urb) {
> + ret = -EINVAL;
> + goto err;
> + }
>
> tmpbuf = kmalloc(buflen, GFP_ATOMIC);
> - if (!tmpbuf)
> - return -ENOMEM;
> + if (!tmpbuf) {
> + ret = -ENOMEM;
> + goto err;
> + }
>
> size = buflen;
> devinfo->ctl_urb->transfer_buffer_length = size;
> @@ -783,6 +787,10 @@ static int brcmf_usb_dl_cmd(struct brcmf_usbdev_info 
> *devinfo, u8 cmd,
> finalize:

The finalize label is used for failure path as well. So I suggest to get 
rid of it requiring modified patch like:

- finalize:
        kfree(tmpbuf);
-       return ret;
+.     return 0;
+
+ err:

+      brcmf_err("dl cmd %u failed: err=%d\n", cmd, ret);
+      kfree(tmpbuf);
+      return ret;
}

Obviously this means tmpbuf should be NULL initialized.

Regards,
Arend


