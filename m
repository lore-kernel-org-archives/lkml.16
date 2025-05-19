Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDE31E5701
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672554; cv=none; b=iziY5SFDCKDltSKPNNaargMijEyPXZwnn9cz24I4r/pijb5OFZTmCIH6tf6ENYJlACyskqANsrRllMx2ERuY61Oq2BMGdW7HaW3KL+GSDJjFyzO03SbSE3+JyKLRTJm0EPjfl1cWfVnXdHotSYbmKee08Na8FfUth+/vMxNytOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672554; c=relaxed/simple;
	bh=0QbvWiCAa+GioZRtVuR1peg4Ser/UC7UOzTp8JIZmZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VG3kVAhhxWADeLxSBAbBDIHm53vrHP9TFLq5VBm/tROqTzRFXpDWnOugNYOWBmRokXP2+hSaS58lHEili+N/MwTnalAdQCKFrJzc0V5SrINkZfOV5R8KqW1blmxpTzZYfW+RsjZWUuhynT7Sr/3aPF/i4XI6UfW/ddhpDkxA2/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hY3aAFwM; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hY3aAFwM"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2da73155e91so1074371fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747672550; x=1748277350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W58GfmIWiZ3U0eNBo2ssjSmziqMleoXnnwt1PGdnFxg=;
        b=hY3aAFwMukUfRB4AEd3dg6nw0Qs+GhudysQ/b7DPD6wJ1IDksewyTz7pA7Xiu4wBsC
         MdCc81yOBJZ5HMK3/TqeQaPyH8yLJmvyU3rW1mN96Y2d0AIJHZPI8++eTkfrj86/ZjXy
         3j8xWG9XVMpO15C6FKlCxVwPju6N5yWS9gdZy1ADxJghtsX18J/c3vnfYNWmiySrNc3t
         0s0NP5/TMh6Nc5m2ly6XV+2GDT9mu1cf0N9BxJfHih+0X9r2HcUfBcyM3+T5O3E85oKB
         EIF2F0yxJsExwNsc8BcUkUF8gO6w5aZNt64W7FcA0fdYz2VecfhatUXstNNyhlQouFzV
         d+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747672550; x=1748277350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W58GfmIWiZ3U0eNBo2ssjSmziqMleoXnnwt1PGdnFxg=;
        b=dkVihAMTxdcIIgXugOg/LyNTkhT7A/izec/iTYpIMHgvVK8QbMq2HAw/hiEdUP6mhd
         5qauTv2mlymB53gbvznBpEEg4fjkwgVFa8Awer/LC7TzX8/xuR5BLz4pbX2NOogV2aHj
         RT/JhkHV/qo39heheSbL1Mn5xCxvIQ2/axWNBvBDm5OOVWt7fD4NEBJSxV0RaqnKHr4j
         9/tf7zrYW60U926yhtatszmgFzhZz563pOtt4+EhgLH+2GopsnmmP6G3E7eRZ4XELeom
         jWTRvbof2rvNZVnCbxKDVJQYuvAyRhAm6VPDVEtx8Xe7d0D/Lx05DD9C4j09RnzeCTzT
         zM4A==
X-Forwarded-Encrypted: i=1; AJvYcCULwDDc1FxCyX8ZiHAYCsYnBLrj3XT1uW2Q+VMFb+Zq/IdLQadeT1Ue0ZQcl3ttyJKc3K7G29vkI56SZOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYGxrdg+G45PcHaErSc0a8bF8KrXuOhmAxw48XDRKg2/Px+yuL
	GwY2brL8l8hNGW8sr6Awp4/T8vCloOWumMwqzmnrkaRptEi+ZsHRLFNPDOyvLXkcH7I=
X-Gm-Gg: ASbGncukLzyq0GMkf7jXn5FgPAk2ffN4Ad/6BEnyu7XtOEfUpVvOpiqDBbHa3f+JwM8
	UZ6861BLIm50cB2EQ9hKOtklVt0/kJ0yoJEUDStrKtvA+YZ+UYRlbs1Ruus850rCGKHFgRoyllw
	LSsi5G94ATYfA7JzxMpNRimwKvtM5XJ1CRu2UnCHdPxQGBMP7QokelfokiERPctHBAE2EnydmWE
	JP9ER9IzJBnSFRk8ITlponuPkvjVvirmz9GbbzVvS8O0LVo7Qcyrp08wnBxoQqn2aA9U0CO3AUe
	/oVovAiiEeshz09SLNX2aKpO0Hm++MDz7fGGNd72tGK/3YsbhlGdvl/+GvFzESULqQ7zee2ye4s
	QNBJyl+3JHBVfOskQp1Jmpe5w9zEAwV9MkoeK
X-Google-Smtp-Source: AGHT+IEqxryGUIrvlFRjjbZt/fpBB4e1H0kstalMU3B2lw3tKXhvZEegqt/3++j3ZSdhGSKMO3o38w==
X-Received: by 2002:a05:6870:ad97:b0:2d9:45b7:8ffc with SMTP id 586e51a60fabf-2e3c817196amr7065629fac.3.1747672550446;
        Mon, 19 May 2025 09:35:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c06baca3sm1795657fac.19.2025.05.19.09.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 09:35:50 -0700 (PDT)
Message-ID: <ba79221f-9acd-4919-abe9-e2c49e80fb6c@baylibre.com>
Date: Mon, 19 May 2025 11:35:48 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] lib: move find_closest() and
 find_closest_descending() to lib functions
To: Alexandru Soponar <asoponar@taladin.ro>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: jdelvare@suse.com, linux@roeck-us.net, jic23@kernel.org, pavel@ucw.cz,
 lee@kernel.org, baocheng.su@siemens.com, wim@linux-watchdog.org,
 tobias.schaffner@siemens.com, angelogioacchino.delregno@collabora.com,
 benedikt.niedermayr@siemens.com, matthias.bgg@gmail.com,
 aardelean@baylibre.com, contact@sopy.one
References: <20250515081332.151250-1-asoponar@taladin.ro>
 <20250515081332.151250-17-asoponar@taladin.ro>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250515081332.151250-17-asoponar@taladin.ro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/25 3:13 AM, Alexandru Soponar wrote:
> Move the utility macros find_closest() and find_closest_descending()
> from inline macros to proper library functions in lib/.
> 
> Signed-off-by: Alexandru Soponar <asoponar@taladin.ro>
> ---
>  include/linux/find_closest.h | 13 +++++++
>  include/linux/util_macros.h  | 61 +------------------------------
>  lib/Makefile                 |  2 +-
>  lib/find_closest.c           | 71 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 86 insertions(+), 61 deletions(-)
>  create mode 100644 include/linux/find_closest.h
>  create mode 100644 lib/find_closest.c
> 
> diff --git a/include/linux/find_closest.h b/include/linux/find_closest.h
> new file mode 100644
> index 000000000000..28a5c4d0c768
> --- /dev/null
> +++ b/include/linux/find_closest.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Find closest element functions
> + */
> +#ifndef _LINUX_FIND_CLOSEST_H_
> +#define _LINUX_FIND_CLOSEST_H_
> +
> +#include <linux/types.h>

Is this header really needed?

> +
> +unsigned int find_closest(int x, const int *a, unsigned int as);
> +unsigned int find_closest_descending(int x, const int *a, unsigned int as);
> +
> +#endif /* _LINUX_FIND_CLOSEST_H_ */

...

> diff --git a/lib/find_closest.c b/lib/find_closest.c
> new file mode 100644
> index 000000000000..d481625cae9d
> --- /dev/null
> +++ b/lib/find_closest.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Find closest element functions
> + *
> + * Based on previous util_macros.h implementation
> + */
> +
> +#include <linux/find_closest.h>
> +#include <linux/module.h>
> +
> +/**
> + * find_closest - locate the closest element in a sorted array
> + * @x: The reference value.
> + * @a: The array in which to look for the closest element. Must be sorted
> + *  in ascending order.
> + * @as: Size of 'a'.
> + *
> + * Returns the index of the element closest to 'x'.

s/Returns/Returns:/

for kernel-doc semantics

> + */
> +unsigned int find_closest(int x, const int *a, unsigned int as)
> +{
> +	unsigned int array_size = as - 1;
> +	int mid_x, left, right;
> +	unsigned int i;
> +
> +	for (i = 0; i < array_size; i++) {
> +		mid_x = (a[i] + a[i + 1]) / 2;
> +		if (x <= mid_x) {
> +			left = x - a[i];
> +			right = a[i + 1] - x;
> +			if (right < left)
> +				i++;
> +			break;
> +		}
> +	}
> +
> +	return i;
> +}
> +EXPORT_SYMBOL_GPL(find_closest);
> +
> +/**
> + * find_closest_descending - locate the closest element in a sorted array
> + * @x: The reference value.
> + * @a: The array in which to look for the closest element. Must be sorted
> + *  in descending order.
> + * @as: Size of 'a'.
> + *

Would repeat the Returns: section here for completeness.

> + * Similar to find_closest() but 'a' is expected to be sorted in descending
> + * order.

This seems redundant since @a already says this.

>             The iteration is done in reverse order, so that the comparison> + * of 'right' & 'left' also works for unsigned numbers.

This seems like an implementation detail so would be better as a comment inside
the function. Although, since @a is always signed, is this comment actually
still applicable?

> + */
> +unsigned int find_closest_descending(int x, const int *a, unsigned int as)
> +{
> +	unsigned int array_size = as - 1;
> +	int mid_x, left, right;
> +	unsigned int i;
> +
> +	for (i = array_size; i >= 1; i--) {
> +		mid_x = (a[i] + a[i - 1]) / 2;
> +		if (x <= mid_x) {
> +			left = x - a[i];
> +			right = a[i - 1] - x;
> +			if (right < left)
> +				i--;
> +			break;
> +		}
> +	}
> +
> +	return i;
> +}
> +EXPORT_SYMBOL_GPL(find_closest_descending);

