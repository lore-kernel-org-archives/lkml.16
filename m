Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921122BD03C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749652983; cv=none; b=lvA61u8XFfRIowZJmmPKjzSjcB30XzNnJ9Q4gOClXFhSIineUiS5P/9i3p3kbWGWgBWUCUmXJ9276DQNmpeXVEx6iigNbvX+fEAcbgBQfstZ9uZFbK5WdhS8857ZYEl9Lx8hXq1G8WEnC4GU3u8LwuG9rwq+act3rSlrvc35TgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749652983; c=relaxed/simple;
	bh=cclPtbM4URW+eHiaPTS+SHyrinx7Ma5PBGOytirKWy8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JlM3so2ZtIOxqgF7r4O3hgt/J16n4erwe9yloHJB3ItAgd6lpGhJbCTI+LXqusrN/dky2/yAc/iqtLtBvTeSMvAvjiwZVgLKfBt1PpFW6sgzgQpJzq5FlS/AYHv8/MvIdUpqxlsE7M5JZy2JTrVhTJ2KKY10CKsfPY7r4ouA3CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jol07FQT; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jol07FQT"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3dddbdef7f0so31609135ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749652981; x=1750257781; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5UqPIqFartaPblQPlcuUyc+gxPJ8IWERL5l+XGvc8xk=;
        b=jol07FQTDs4ygUJ5p/drnb1EO2WFd3tK65xZ6JlkTL9hZI/NMie3nqJV6/VuN1XZGX
         Jb7lEEldumQ9QtSnCIPsxFLF5Dcbzrmj95ffHXcVWrVkGO4d7pXpMo7uerLk6rwBliOk
         jzLsCwqVs5KhOhuWQru+T8ivqllE74V+UGjKEk3UeDYJrDq1566x1C3YP1I6vSfSdztX
         64GkQzmdlvg2tn4ii7JopVy2xK9WVsadIeV28o1Jgb1ABYeN7kl+u9JUX05MNDh4R2PZ
         bPnnf33XjfCRbRkUZNgsAEBxqtPxvLB3beEbu0jGCRpxCh33dQM3ChVrevZvlSDhIqgo
         1LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652981; x=1750257781;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5UqPIqFartaPblQPlcuUyc+gxPJ8IWERL5l+XGvc8xk=;
        b=vYjsIiALmenh/XdRK0B/KRgqqDG14aQd2W/87gv+Hk81CPq4sN1jczrLNKIjjkHtmv
         H9mJq6tOa4CQIjeT7oFCGFsD1xjOxwxBTEp0poELTBlLMsFGnEaO2wKxGpNgpz2n9W4H
         5z4fTbh6bnt4amCkT7yxu6Y1k/vGmYtcNNJdo3tEadnCl/f4FiZ5DE0rXybD6+WMRdJx
         YWaoB9rzpQUA8ccd54OkEJ7IHRjkDw5Lj9MDUO6hfHeVdHY8R/ZzZT/khGxXuz9wdhfH
         qMcKCqgiv6hMha74TVcffixV7Pit1pmcJFTyfawAbdzlQwvGYHDVqTuhs92+Nvg16mv8
         sOvA==
X-Forwarded-Encrypted: i=1; AJvYcCV9B8EBVnpU1+u53l4BRC/Ld12cR4Ou8kn/tsz75SIdva4R0ZFb7HSCxde2VFcZJKloV9YQ6PA4FnCkyZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIRPh7ZzweT18t50SI6SXKDg4NFvizUF1h6n1Lzf5dwdcgEj84
	r4BJqfzVXvGqUpVBoCQQ7WC0i5/1VRER17WwsBFAWRB/UUWLcuy8H1ebHUikztjMwpTGGWEXIf2
	TamGG
X-Gm-Gg: ASbGncufIfCNhz/7tCYVdpqth/d4+IfiPgRoupM7EZnaa/cjxczsDN0uleH3LiiK1hf
	Uv1/AgxKlPSYzJjQQ8JO9lKosuV7JXngj7aapE2CCnV252IGKzAjMAqxaB84odd5F5RIaOKMFFZ
	lJRGP6FBArOIIoVCGlPS3T7KBqfYCfQQnf39momoDzBvUY4IJnl+wgrCXqJ35sUW8qHIO/XxfbN
	KnafPjTAVPT2DPEQktXaLajkzTZuIjojxvTsU/TfIwub+L/oTrL4DqSG6VUvGij2DBQHLxBn4oF
	Mdo2N3K4MLyrZyLfYAR+gQaQ8/5jrbBavf7TpBJ/VnlABisIafRlFBmParhox7Jzp+rRIUsyTbK
	avpVngil+B1w/sUUjyetYRCNX
X-Google-Smtp-Source: AGHT+IFC7MoxQ9CiG2v6hQKNS9M+a23H++31zfrbnKZkH0xG2tyrkZnEOyKLbgpIwmujkpqmsiL1Ww==
X-Received: by 2002:a05:6214:300a:b0:6f4:ca4f:43f8 with SMTP id 6a1803df08f44-6fb2d0ce77amr44105966d6.6.1749652970490;
        Wed, 11 Jun 2025 07:42:50 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b1ce86sm82940086d6.61.2025.06.11.07.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:42:49 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:42:48 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/33] tty: vt: use _IO() to define ioctl numbers
In-Reply-To: <20250611100319.186924-8-jirislaby@kernel.org>
Message-ID: <s30q2616-q5ss-64oo-92r0-956nss9p244o@onlyvoer.pbz>
References: <20250611100319.186924-1-jirislaby@kernel.org> <20250611100319.186924-8-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Jun 2025, Jiri Slaby (SUSE) wrote:

> _IO*() is the proper way of defining ioctl numbers. All these vt numbers
> were synthetically built up the same way the _IO() macro does.
> 
> So instead of implicit hex numbers, use _IO() properly.
> 
> To not change the pre-existing numbers, use only _IO() (and not _IOR()
> or _IOW()). The latter would change the numbers indeed.
> 
> Objdump of vt_ioctl.o reveals no difference with this patch.
> 
> Again, VT_GETCONSIZECSRPOS already uses _IOR(), so everything is paved
> for this patch.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Nicolas Pitre <nico@fluxnic.net>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
>  include/uapi/linux/vt.h | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/include/uapi/linux/vt.h b/include/uapi/linux/vt.h
> index 714483d68c69..b60fcdfb2746 100644
> --- a/include/uapi/linux/vt.h
> +++ b/include/uapi/linux/vt.h
> @@ -14,9 +14,9 @@
>  		/* Note: the ioctl VT_GETSTATE does not work for
>  		   consoles 16 and higher (since it returns a short) */
>  
> -/* 0x56 is 'V', to avoid collision with termios and kd */
> +/* 'V' to avoid collision with termios and kd */
>  
> -#define VT_OPENQRY	0x5600	/* find available vt */
> +#define VT_OPENQRY		_IO('V', 0x00)	/* find available vt */
>  
>  struct vt_mode {
>  	__u8 mode;		/* vt mode */
> @@ -25,8 +25,8 @@ struct vt_mode {
>  	__s16 acqsig;		/* signal to raise on acquisition */
>  	__s16 frsig;		/* unused (set to 0) */
>  };
> -#define VT_GETMODE	0x5601	/* get mode of active vt */
> -#define VT_SETMODE	0x5602	/* set mode of active vt */
> +#define VT_GETMODE		_IO('V', 0x01)	/* get mode of active vt */
> +#define VT_SETMODE		_IO('V', 0x02)	/* set mode of active vt */
>  #define		VT_AUTO		0x00	/* auto vt switching */
>  #define		VT_PROCESS	0x01	/* process controls switching */
>  #define		VT_ACKACQ	0x02	/* acknowledge switch */
> @@ -36,21 +36,21 @@ struct vt_stat {
>  	__u16 v_signal;	/* signal to send */
>  	__u16 v_state;		/* vt bitmask */
>  };
> -#define VT_GETSTATE	0x5603	/* get global vt state info */
> -#define VT_SENDSIG	0x5604	/* signal to send to bitmask of vts */
> +#define VT_GETSTATE		_IO('V', 0x03)	/* get global vt state info */
> +#define VT_SENDSIG		_IO('V', 0x04)	/* signal to send to bitmask of vts */
>  
> -#define VT_RELDISP	0x5605	/* release display */
> +#define VT_RELDISP		_IO('V', 0x05)	/* release display */
>  
> -#define VT_ACTIVATE	0x5606	/* make vt active */
> -#define VT_WAITACTIVE	0x5607	/* wait for vt active */
> -#define VT_DISALLOCATE	0x5608  /* free memory associated to vt */
> +#define VT_ACTIVATE		_IO('V', 0x06)	/* make vt active */
> +#define VT_WAITACTIVE		_IO('V', 0x07)	/* wait for vt active */
> +#define VT_DISALLOCATE		_IO('V', 0x08)  /* free memory associated to vt */
>  
>  struct vt_sizes {
>  	__u16 v_rows;		/* number of rows */
>  	__u16 v_cols;		/* number of columns */
>  	__u16 v_scrollsize;	/* number of lines of scrollback */
>  };
> -#define VT_RESIZE	0x5609	/* set kernel's idea of screensize */
> +#define VT_RESIZE		_IO('V', 0x09)	/* set kernel's idea of screensize */
>  
>  struct vt_consize {
>  	__u16 v_rows;	/* number of rows */
> @@ -60,10 +60,10 @@ struct vt_consize {
>  	__u16 v_vcol;	/* number of pixel columns on screen */
>  	__u16 v_ccol;	/* number of pixel columns per character */
>  };
> -#define VT_RESIZEX      0x560A  /* set kernel's idea of screensize + more */
> -#define VT_LOCKSWITCH   0x560B  /* disallow vt switching */
> -#define VT_UNLOCKSWITCH 0x560C  /* allow vt switching */
> -#define VT_GETHIFONTMASK 0x560D  /* return hi font mask */
> +#define VT_RESIZEX		_IO('V', 0x0A)  /* set kernel's idea of screensize + more */
> +#define VT_LOCKSWITCH		_IO('V', 0x0B)  /* disallow vt switching */
> +#define VT_UNLOCKSWITCH		_IO('V', 0x0C)  /* allow vt switching */
> +#define VT_GETHIFONTMASK	_IO('V', 0x0D)  /* return hi font mask */
>  
>  struct vt_event {
>  	__u32 event;
> @@ -77,14 +77,14 @@ struct vt_event {
>  	__u32 pad[4];		/* Padding for expansion */
>  };
>  
> -#define VT_WAITEVENT	0x560E	/* Wait for an event */
> +#define VT_WAITEVENT		_IO('V', 0x0E)	/* Wait for an event */
>  
>  struct vt_setactivate {
>  	__u32 console;
>  	struct vt_mode mode;
>  };
>  
> -#define VT_SETACTIVATE	0x560F	/* Activate and set the mode of a console */
> +#define VT_SETACTIVATE		_IO('V', 0x0F)	/* Activate and set the mode of a console */
>  
>  /* get console size and cursor position */
>  struct vt_consizecsrpos {
> -- 
> 2.49.0
> 
> 
