Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C03243378
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192999; cv=none; b=ebo6vF32qmaKLh4RsbB0W6DyJqZGOvaYhbc9Spp1eVdviW6KrfZX0iVFaIGh1IFdp82TZ3eCkxohFXPZ2w/W5tKK+ylY2p36UnqGOaCszrLXCga4aSyDu6LM4mQOLKGQe2EHy4hOvrhZnvdfEy+do/mb4gXKpV2sen+lz1Gxzzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192999; c=relaxed/simple;
	bh=Jl2cDYaEC/8KYXJ6+YjEpKKhYtfmG5b+7PhvZl+Ph04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPO7ZLOAReCHyePvwS2oYKTW2W+kYhhonRzFbGSlxDA8w4+9wWTuzJt9+a2/ziFCBGsymqmvTIyHoxsWEA9bth0VbL4+wAkNjYpvXTcd+579G1DSQjTYTlzG7TOuWdX/68HTK4fqO0V4wm4PALOR9C8OsEMVB6cty8ZUCO8T28o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Tk9oIRI5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Tk9oIRI5"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de727f7f05so1892313a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 05:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739192996; x=1739797796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8iDjitnePveiMkv0iAQCbmoij7UIH9xbSCqXpO1GKK4=;
        b=Tk9oIRI5cs3v5QR+Ty+mC/CDTGaxIfOyq9wp5qbBWSx47b7ubvExcedkyT0lxKx8i2
         glToHgHKhS7AX+HyymH8rykWE84IRCbO4NCQFZPm7DO1zMVqSdSn0RcODi5fzL/IQY9k
         CKO2SVW2TmiijrxwAlF6DgUYRsjGinogDWhB8yjJYJSsYwLvIkFL9L27GLvew9MGdrL2
         Ba8517CRruQU7PArcPloQG72bxQG6ePfbJP+C6Y8UyJosAldTKdV45bmj1sPjE8fstFd
         BStUFqVYEiP5SMTFht94H/xPCY6bRspPIp/I23V2eaReoxViY0kG4jwL3KuQwAgA5+3q
         eUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739192996; x=1739797796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iDjitnePveiMkv0iAQCbmoij7UIH9xbSCqXpO1GKK4=;
        b=To2SONTBlQSwqmBqwdZ6Z1w6HtfuGWVP3PHYDtnhXDubcLCTlIn1aWSVK1YnwfGLL2
         CDWqfyxjL1+wNwaeGAuArhCRSNroea0jhBQMCWIMKae6xo3hn08sBATKsA0uWeYIl46+
         eFLlmhhVBcXBpmaUg9tCgEQwOwln1dnrBuiiL8F3nbKssmRSoNd8XUj6ZUgQhNpNbnj/
         8oDtxe49g8yfEVerIi/PKQG18CFP+sovpcSI7FPXRiAzOuuBiIPVBzLFZraKoHDGActq
         PG3MDqT3i53GaGojnQ/90QYMGT84wckBI+pk3M+8l4AKpFBnkF8R6hv5KwJxe5RyAu7e
         btMw==
X-Forwarded-Encrypted: i=1; AJvYcCVmvXmM29+zdi/lpHFYOY8149+YUgyXE32oWOaq3Ah9ivqUDQ25fl5pnXJD/O8wOkSCAn7+FoJ87q4IajQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnsIou1Ve7lxczL4/x7S6mDlKtJo2aMbUZOGnaUVWdd+Dpa3ji
	9+4bQKCd2/mxvKPnV5MieUGt58uZmFnzxeqRxc2ZzY2L3r0o4egSIGC82/sSSpg=
X-Gm-Gg: ASbGncvb0rZVwTVMwLhGbirqyHOCC89q4AE4feqVuuNpGFGeNooNhaaiiF7K/ifvDyx
	ZVWlCOu+bRTMh0uTb8oyBoGo24fvVoNWwzrYFyB5nE0bnndwIiXnWF7vsgx1rv7KViVmhPi1jSG
	TLJe6w49tmZ1tz6QOeB0FJ76ZsDuXw59Uk6jwbKifkHMvS6UWetKbI/AnuCfN1L0yhY0F5/aT6k
	kfMBZXYvcZfjqpGBKYca8ts59t6ua21mXE05AUmzuNRoEZGs9PIrpG5dcoU20GpANRc4AJ1xuxn
	s31BsuArpeujxu+4cg==
X-Google-Smtp-Source: AGHT+IFsPXNm0VN4fhz9j1YlISnSLTnhxSksqXJSZH2pF4LIrrD49Yd5+0t4LxBW7zYNbwlROSfHIw==
X-Received: by 2002:a05:6402:1ec2:b0:5dc:cc90:a390 with SMTP id 4fb4d7f45d1cf-5de4508fbebmr15214488a12.32.1739192995658;
        Mon, 10 Feb 2025 05:09:55 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4ba95a32sm6561228a12.40.2025.02.10.05.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:09:55 -0800 (PST)
Date: Mon, 10 Feb 2025 14:09:53 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: I Hsin Cheng <richard120310@gmail.com>, rostedt@goodmis.org,
	linux@rasmusvillemoes.dk, senozhatsky@chromium.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, shuah@kernel.org
Subject: Re: [PATCH] vsprintf: Drop unused assignment of fmt.state
Message-ID: <Z6n6iWwnpA6wuUMD@pathway.suse.cz>
References: <20250205172508.55358-1-richard120310@gmail.com>
 <Z6TWEHvBF0HOxKsY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6TWEHvBF0HOxKsY@smile.fi.intel.com>

On Thu 2025-02-06 17:32:32, Andy Shevchenko wrote:
> On Thu, Feb 06, 2025 at 01:25:07AM +0800, I Hsin Cheng wrote:
> > Remove unused assignment of "fmt.state", in both cases the value of
> > "fmt.state" will be overwritten by either "FORMAT_STATE_PRECISION" or
> > "FORMAT_STATE_NUM", the value "FORMAT_STATE_NONE" isn't going to be used
> > after the assignment.
> 
> ...
> 
> > struct fmt format_decode(struct fmt fmt, struct printf_spec *spec)
> 
> >  			spec->field_width = -spec->field_width;
> >  			spec->flags |= LEFT;
> >  		}
> > -		fmt.state = FORMAT_STATE_NONE;
> > +
> >  		goto precision;
> >  	}
> >  
> 
> While both are kinda redundant, this is not obvious what's stated in the commit
> message. Yes, `goto qualifier;` is straightforward, but not `goto precision;`.
> Which makes me think that these assignments can make code robust against
> potential future changes to allow to catch up the wrong code paths.

I fully agree with Andy here.

That said, I see the following right below the two conditions modified
in this patch:

	/* By default */
	fmt.state = FORMAT_STATE_NONE;

A good solution would be to move it up. It will be then obvious
that we could remove these two initializations. I mean
to do the following:

--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2563,13 +2563,15 @@ struct fmt format_decode(struct fmt fmt, struct printf_spec *spec)
 	const char *start = fmt.str;
 	char flag;
 
+	/* By default */
+	fmt.state = FORMAT_STATE_NONE;
+
 	/* we finished early by reading the field width */
 	if (unlikely(fmt.state == FORMAT_STATE_WIDTH)) {
 		if (spec->field_width < 0) {
 			spec->field_width = -spec->field_width;
 			spec->flags |= LEFT;
 		}
-		fmt.state = FORMAT_STATE_NONE;
 		goto precision;
 	}
 
@@ -2578,13 +2580,9 @@ struct fmt format_decode(struct fmt fmt, struct printf_spec *spec)
 		if (spec->precision < 0)
 			spec->precision = 0;
 
-		fmt.state = FORMAT_STATE_NONE;
 		goto qualifier;
 	}
 
-	/* By default */
-	fmt.state = FORMAT_STATE_NONE;
-
 	for (; *fmt.str ; fmt.str++) {
 		if (*fmt.str == '%')
 			break;


Best Regards,
Petr
