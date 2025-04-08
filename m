Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DF722FF4D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131667; cv=none; b=DM7sYqUbJRFS9MTrItAxffRg1cWxeMzYrtcP1azGcof4U7nasdjWW5jRlENVU1bHFtEHeDdj0THPfXsyK47iJJVusIafRWZnkiPkXQGqd8RtYw78Rg8tb4mUDVS7de8PfB4YvvFv0BB9tNUy1RrbsfJBap3xN4c3Ng+4rw9Aa80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131667; c=relaxed/simple;
	bh=Tg8C3b1rOY1CSWk04jheGSA1ilW4cXdRxQ5PtypNTYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cvhph8jUlSvKB/N61CClI7rbycHELQW7/2xNNLYhmSSi3JtxojH+0riywXgQseEHj4wbzwscPbuQXIvcNGsbws6z7fIe85mvKVxKPMhh5WFjiSSrhQ9UWkrfDsQgr6nXdePjC0UOzLuvckhLwcUaQ35baUutNtVRm8ICw18/9/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bsohgrHM; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bsohgrHM"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47691d82bfbso114451811cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 10:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744131662; x=1744736462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zpzhn6xCE53mAtkyCbedASbK8gEL7iLOARsPXqOtB8M=;
        b=bsohgrHMx1PburCRzAX+gXY3wS2qZAxw/cUyLt42rkhdwcRyu2YqiAEltpNZGjHBx+
         HUFf3wi+Ml4aj9Mt+q+cLgRCVm9p068ky/jFuWFur7vCqsihpgLwXZ7lOJyhXCr0X79V
         Gkd7JJ3fNTF+siL0DtgIiDxHdwNUGIV0xjAuoePPcnAQxjOpo1EpCpOD4uLQrd5wZJZW
         DgxSNMdJApxzeIz3ZTcbdPEa1Hna3ish1d+fNtZCvzkIL9eq58z3GZoqiCJt2UNF+5GD
         uHQOnymcMUyxGeLWKmTerNjuhzUkjwiNBFI8qF/b8UtKBgT8VZt8bv48WD3BlHR6o0nL
         BGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131662; x=1744736462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zpzhn6xCE53mAtkyCbedASbK8gEL7iLOARsPXqOtB8M=;
        b=RLPWX42D9IdIrdReQN+kWDH6dY8hz92sI7/w+hzd2MO8TaSHzuuMWnSWNgNCnujeB7
         yJn8SgjCo3TXCvy8pTVfKThLNVhQSm40+qzrr0DLTeotVL7FP2fgcYQZ31ORkqWvw7dd
         W+s88YoHdSJP8XDpefZyvf7XIwSQR33mpVK/lOGNVeIwzQ7IVnVGadJWzzXEnecTrQYV
         fUPF96MSwoGD/pnhmqBQ1r7RTLu8EO4kJbbYUZzOjXzP6kJBSz8N9uYU8E+FGPkgKduj
         W90NVTLKh1PUbHgJ/2hMynlNH9nbe8IDQ/YzU6n0KScyLCvKVOoMziPBPQTzf2XhVirx
         Ofsg==
X-Forwarded-Encrypted: i=1; AJvYcCVg0rucsfXgjuIcP03cP1hBZ29DEZQG0nlUykBtR6DaB3vgTFJxlhIoxLEeklTGwx/h5nPsYnfxBnSm9TE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUGq72zWgOdkY8Bgu+bSBXjQFkyXAThipqkylEPfmCdjMzqlnx
	cOWgR40gOGpclkr/GOvaJeJkh3HwJVmA/g5xf7OSgCbLDLA2jdcJY1kgHytLKg==
X-Gm-Gg: ASbGncsMGJPfEqmwGGo44i1d4+BdeFVx1ADOE6dqTZHTvv4ThX/cA4iWlEwDBKQTpOO
	ArOi30lyRdRIBptzf+wLaQDUyPnOSLEsT9GehAfjk4ZENsrVaSFkJA4tMq19Vt87G17q2vmOGIi
	satQPcBkbI5cNOzKu8I/PIMhiX9dlby1vbz5zpYd4xSnB2D6WPX5dThrfksd6wnVdTKtHyLsBFN
	TdN3HkIQ/0trfAEo88d0YTHae7QKr9kVAM0oQ9F7xM/rMzMrdCU2f2Gi9oCGFmSHMVLKYbwutr8
	0HDR28Qg0amLAiadWHYmbdeMtE/bZzukpBYa0YcYB8f3ivLPkFxHmKA=
X-Google-Smtp-Source: AGHT+IEysSqswzuNKiB8rn8xmkqLQ0WmwDSclxBP7ExDTpni521Ot0pUbkPfNzGjU97ScPjpo0cLGA==
X-Received: by 2002:a05:622a:1812:b0:477:1edc:baaa with SMTP id d75a77b69052e-47924902f72mr236718651cf.6.1744131661797;
        Tue, 08 Apr 2025 10:01:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::93b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b088428sm78218491cf.38.2025.04.08.10.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 10:01:01 -0700 (PDT)
Date: Tue, 8 Apr 2025 13:00:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH] USB: core: Correct API
 usb_(enable|disable)_autosuspend() prototypes
Message-ID: <b82feb96-0f5c-41e6-a472-667c8ae4f367@rowland.harvard.edu>
References: <20250408-fix_usb_hdr-v1-1-e785c5b49481@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-fix_usb_hdr-v1-1-e785c5b49481@quicinc.com>

On Tue, Apr 08, 2025 at 08:08:51PM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> API usb_(enable|disable)_autosuspend() have inconsistent prototypes
> regarding if CONFIG_PM is defined.
> 
> Correct prototypes when the macro is undefined by referring to those
> when the macro is defined.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  include/linux/usb.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index b46738701f8dc46085f251379873b6a8a008d99d..1b2545b4363bcf3ef97a53a004ebf456eb9d5d05 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -815,10 +815,10 @@ static inline void usb_mark_last_busy(struct usb_device *udev)
>  
>  #else
>  
> -static inline int usb_enable_autosuspend(struct usb_device *udev)
> -{ return 0; }
> -static inline int usb_disable_autosuspend(struct usb_device *udev)
> -{ return 0; }
> +static inline void usb_enable_autosuspend(struct usb_device *udev)
> +{ }
> +static inline void usb_disable_autosuspend(struct usb_device *udev)
> +{ }
>  
>  static inline int usb_autopm_get_interface(struct usb_interface *intf)
>  { return 0; }
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250408-fix_usb_hdr-8305358f42e1
> 
> Best regards,
> -- 
> Zijun Hu <quic_zijuhu@quicinc.com>
