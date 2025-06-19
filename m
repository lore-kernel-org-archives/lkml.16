Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A136235073
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341739; cv=none; b=ch99neFGwkwf33yQQ62D5zzKhbOD0RUmutuZv82/IXuWpipAuHK2GcZiEvsSuzD1EkFF2T+zGJ5udOwBIEbWusQD/iiiMOCS2GZGk4y/0nbsGOToeYrPtQK7WSAhNF++VX0jKgGZzGyuDdgKSzP9CztorMxOQXMIj/hnfVtfZEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341739; c=relaxed/simple;
	bh=Wezz9bOmQBcQ1TUJ8Bn0jTeSjZaBZvH184Tg1O/8m8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpMXfwHcpjqhfByMlNPLkk8bx+eWtTZbQQUmN6NFCwFlb9VgASUSc4Hm2xip0nKvw5D5ZL3uvmC2F15oYXTav+AQP7w5VmBbyMiq6mcLx4w9UjD3C+t+HSpdkn+e2OJ9vPxgQW2ReukKFYg7A8rx0UJCRNoW0+l7KqFR7XbP8AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L4cFP12u; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L4cFP12u"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b16a0e38so894427e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750341734; x=1750946534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aVriD3LvP+pMWvbTjI5kbfItE2BHS3ery/f+bu7NdfQ=;
        b=L4cFP12uTMk8JwfeO0v3GW+A+YPyvB6q4ldEMMIqkzWrA6mrG2mbkpvgLvnH/MvX3z
         QbTGB+L8OQy+SX9+ByTM++0fJXTsogKi1hFQboJiCvDZZoVhx6EPmt0QHmt1eFN+M8db
         1QE+Vtf1bxpzj9WSfjMffuIUT/lIgDzIru17F/wZOEpfKRr8gU/tglCq7DHdBgjfsHoE
         sKbizAWFathofHFBdLCHMOv+JNRoxbN5+VhFCucJf3Yo4zVHWG18PtPcIFDnH2jDhB6d
         R6e4QSoaZKy0pskD8DABQ5fxG0vrZZJn+EhlwDWF2dzO1cR23zaNGs5xsZHgbdFJr/te
         DjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341734; x=1750946534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVriD3LvP+pMWvbTjI5kbfItE2BHS3ery/f+bu7NdfQ=;
        b=cMx0y3EtcNLbeuR8KyCls0/ogIUYupBKNBfnkexLB/qsB62eYwdRxIMtnwH/bei5I3
         5t+dHjUID1svu3mL96JyyNAmCiVCtWNU1f6Mz7n/PuPjvFi9SwvNPpFp5/tboopBloa8
         noSvOG5T6J6aJRcjeK5Kx9xNdZo83kXZrYtPyhD2TDwJv1wTnsfJRI85vkLOsUD0EtkP
         EeLPNZywSGUgvWGt839OBg8rVnKGfguJXeKzfnhCIiuEpUNDGWH5abOz1fps1nzoovZT
         HT/TnL3Ra80BiN7Sk/Iqfk3+czv7gtbtU41VZBm1QKFnVtZuNVrByO+Vggo21WDt6AKV
         LUBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnTPpjTK+MqDFqCuWVd/vwW4UcfYfq48bo5pQXfvXR07fp0lxFZFZur41zmEVW27J0Sx9pQWwaoVgGdvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd5473OmojptzZQ8I0OX6fMVSfNHUuBY5MbXO9kujRcvRwVA8k
	ZMNOUFD+7/tc2jG/Gyv788eIV7T/9Wy1jdgR/5qz5IejkZDBCimwvDIbm6Dd+CminiE=
X-Gm-Gg: ASbGncudPXjs63FKnetZ/KwP9Bbt/g/mUUzLY3ZjnXRiSgb8jGpBRNX4j+3ymA6ll6o
	i8WGmsivT7HNr/ECabGdE7ImRt8dUThr01jna2T3eBojlwIp3fkL9BgdU7vKsgnhKMFsvA3ZIBC
	TRiwZTDxjSKx49Dvw3EEap9q1LmhDcRAb03aozdf9BRMxeoJg9XTbPa4ia/C88B8QuTO9pmnPbz
	koNwSoYpUtqbs42zRVZ912EKhjqJAUCjMYJMAJthyBrVCdFTo6oSqNhtbn3zAqXDDzid/ifIO9W
	q4FZYdddDZqnqyew1ApuUF7mehNV7lee0Gwtb8BQGqB3U00tQEjxXxQlOZYcCL5GVI/l8L/INwU
	=
X-Google-Smtp-Source: AGHT+IE8zVuCTN888UI9y/00n231FNOHGEnuXXDDP1EcNgSBpNMrZXqn05vmM5Fu8xUtJ3hiDai1XA==
X-Received: by 2002:a05:6512:33ca:b0:553:543d:d963 with SMTP id 2adb3069b0e04-553b6f1ead0mr6203514e87.36.1750341732009;
        Thu, 19 Jun 2025 07:02:12 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159b909a81sm253188a91.5.2025.06.19.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:02:11 -0700 (PDT)
Date: Thu, 19 Jun 2025 16:01:56 +0200
From: Petr Mladek <pmladek@suse.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <aFQYVPmStsIIFcMW@pathway.suse.cz>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618041235.1716143-2-anshuman.khandual@arm.com>

On Wed 2025-06-18 09:42:34, Anshuman Khandual wrote:
> Add a new format for printing page table entries.

How many users do you explect, please?

This patch adds only one caller. It does not justify the added complexity.

> @@ -2542,6 +2545,23 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>  		default:
>  			return error_string(buf, end, "(einval)", spec);
>  		}
> +	case 'p':

Please, do not opencode this in the already very long switch().
Move it to a helper function.


> +		if (fmt[1] == 't' && fmt[2] == 'e') {
> +			pte_t *pte = (pte_t *)ptr;

If the value (pointer) gets dereferenced then please add a basic
check:

	if (check_pointer(&buf, end, ptr, spec))
		return buf;

> +			spec.field_width = 10;
> +			spec.precision = 8;

Is she precision = 8 really needed?
I guess that .field_width + ZEROPAD would do the trick.

And them maybe special_hex_number() might be used instead of number()
and safe a lot of code.

> +			spec.base = 16;
> +			spec.flags = SPECIAL | SMALL | ZEROPAD;
> +			if (sizeof(pte_t) == sizeof(u64)) {
> +				u64 val = pte_val(*pte);
> +
> +				return number(buf, end, val, spec);
> +			}
> +			WARN_ONCE(1, "Non standard pte_t\n");

This is nasty. It should be a compile-time check. And the code should
get fixed on all architectures. If it is not easy then
it might be a signal that the generic %ppte flag is not a good idea.

> +			return error_string(buf, end, "(einval)", spec);
> +		}
> +		fallthrough;
>  	default:
>  		return default_pointer(buf, end, ptr, spec);
>  	}

Best Regards,
Petr
