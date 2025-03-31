Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E649670805
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403582; cv=none; b=I+4YOzC0Us97UlEHpd7cujHpKrYRRHtBfR3FChsn0GXX6KHnnVvasl3Gq6lGa+h7xilTymX8aa9lEJRzp6GdVW2WFk2lgi7gTyBhqCRo82XxZdB4OSoBX6dBwybtGy7ZmCZX3wa1j2nXIu03xM1orhhkZO3QJ2xWzSGi4Hq9X8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403582; c=relaxed/simple;
	bh=jlSvjAFn3alQ4Yt+kDwAuBIfr3O8/1uPwl29MTTzlVA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Dbs/NSjsib0g3LYZhm1xCWyvXUCjIJypxPUAjFmZIh/HeXgaKmctRI1ToDIjPP29EXBdpIRfLfgwLy6IZ2edHT8GvSs2QQdqdBln4BQIzcNJv4V+Z7+gHjn3MvxQOOczMYpQdNwhoQM+wwFWq0u2s8VwHyWCgcnhaa4i9qBRgXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4njhH0I; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4njhH0I"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so32784835e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 23:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743403579; x=1744008379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AA4sDqP4J8juhu+e1eHgJ4HsEPfRns6pCAnRWR1sqHg=;
        b=c4njhH0IefARTcXjurUd2qOH2+9usm5m+9t4MJq7+BnHv0326GpENb0jN7/BvKmmOh
         sFrp7slesm5vPOdsjxnfDzykXTom1jPET4hSpr8MVAdjROWwEN29FMkxByEWbWoNa9MX
         wtHkGXBDP80sJqmwvJiEeiiqzcrl7DUCSd3FR7RJ+bJZJcyp1wudHulxpQr12xpgKuHN
         D5borkN+abmfMm+rxC9s4Rl2Jft9YCrwHBGYWp869MgEnsA9wf2kosHcBOX2iXYmqwaz
         c5Kv9N3ZA58MiWrwF1oLtHwI/BZi0r5UADwQyJkMnxWO5JNHsoKjAi9r1yJzGLdBlGau
         nLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403579; x=1744008379;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AA4sDqP4J8juhu+e1eHgJ4HsEPfRns6pCAnRWR1sqHg=;
        b=tJ/iuTLueDQNNrtZ34W4mXM/2T18ALgMlrVd+4xPyEQsNErJ7FToXYGHimaHG+U0zs
         roksIjMUVVFM42U31RHTOATKZxFMg6y1pCqoJ0onf9n/iVF3IBtI0YRwXa75FUab8Xc/
         JAua3TtoTbz7+1n1X1hp49qhbjaKjowFWtM/yIYJLv4WzR9HQk4/3VUiSSPHvq+pum2e
         5UY6WgH2V2w7O0CmFQEFF9lWxOa8ZxyyNqSAI3JwgRXWHue4ozoMS9NxzcVraLKj1CA2
         JjLVRRkgKVmq52ts1jsl6phThTgT9Rr5eG+uwi07NcUmJE1iHc/CPjNthZP0zbJvf/Tk
         zPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRmTrKJyWT1agpXwPpEE/CUZMB96ngA30d4wlRGrb4cyGjbAJwS/FrTM3RUqK+/3bS/uRIj1h5woGkExM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkf1Vvya5dijy4X7j2WPE7uPQJCmBmFRzmJ2RD7/xqsvGQo3az
	vCaSxEocBMZfZB60a3SK5mMzwiximWd3UHglHVfEw7bUy8XpL9Ls/X/Gnp9HCDE=
X-Gm-Gg: ASbGncuIeslVnYvIf5sCWC1o9UQGN/p+xukVhpsxm+tYLO5hZ7JkPbnf+b/5xvj0b7L
	emS+yOnSBfCHRE5AU0TPtO7Gg6aaU3RN6fgqvTRiS1CTxj94bloBEdq0FXtG4EZQ5Q4/sHeyHjw
	Pg+g6dzRjCzIdDACF+1hhZK5fTlPztrDv61SyUISiA5KkY1NkM2RxCtrBIxBNbFYlLFtOu95zwc
	cyqFJpv6j2iV7+B5Jn6KgpdKxZtH29E+cdFttAva5NivTVULtrMny/T0pXiUDy1Rf1Pn+pvl4PV
	9Vwhe1Wh68KFBkC3zlirfq0Th/v9N1kEM6w/iQdiS4vux5xYny8jvC4BFg80+DCMoNaGokejTJh
	LkMismQIor9CTd++w
X-Google-Smtp-Source: AGHT+IGx1f4vC8GTeK58NiotvPS6asWIcIisQro1qkimwNxZktvh2jq9DwcElB67LzcJE4nqjvtuyg==
X-Received: by 2002:a05:600c:5108:b0:43c:f629:66f3 with SMTP id 5b1f17b1804b1-43db624be12mr58276565e9.18.1743403579170;
        Sun, 30 Mar 2025 23:46:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:143:2e3d:45f1:fd2? ([2a01:e0a:3d9:2080:143:2e3d:45f1:fd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314b6dbsm157837065e9.36.2025.03.30.23.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 23:46:18 -0700 (PDT)
Message-ID: <82674b8f-4fc3-4fd2-bc7d-f573d2d11b58@linaro.org>
Date: Mon, 31 Mar 2025 08:46:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] media: MAINTAINERS: Add myself into venus/iris to
 maintain/review
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/03/2025 02:26, Bryan O'Donoghue wrote:
> I'd like to help out getting patches reviewed and merged for both of these
> drivers.
> 
> +M for venus
> +R for iris
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Bryan O'Donoghue (2):
>        media: MAINTAINERS: Switch from venus Reviewer to Maintainer
>        media: MAINTAINERS: Add myself to iris Reviewers
> 
>   MAINTAINERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> ---
> base-commit: f2151613e040973c868d28c8b00885dfab69eb75
> change-id: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
> 
> Best regards,

I have no power here, but get my:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
