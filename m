Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA5227815A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323996; cv=none; b=Y8Ea+laG2pgTeKuo1RL6J+eL7wi/OM4QlxKJoy/LvB/4Ww4BZuu+s5ZrPdUHUSlpb/dQ4ygI9yXOO7ihGILAODHCruiThEZ9KVizGf1pCRMDlU7BOySCkIkAxvgduWR8Nj6SyxNH2VBNK9NN6hhGvvLEjRY4BFhiUOYNJLU6/tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323996; c=relaxed/simple;
	bh=zw0Kx0vwXl05LkDdgW9mYr/vrDHtjtl/E6rMarjAzVQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AYmZoGgyGB29vJAb2QvAQ2YhV65DGBE9xyFed82T4PBhmzOcixhndhN+V6o/JRrhy9SKVq/U7vMy4FDBMZSCw9XTB8odIrnDKofyNoaiMFEYAvBTL2f1ghEcbXulwmzcTyiCe98IWuynarwM4GMC7Hgl9I16dfTiJoTFg4EkDWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kITc1WdS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kITc1WdS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso41987505e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745323993; x=1745928793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+uEvjm3W1Mv9sborJNH8uTHXI0JDlmAQqTkyMWbehQ=;
        b=kITc1WdSwgWL/7j0Ikk/ZlZjMDSZv0mw378fdGd4xzCau90VQ+s6uvWNipnmtpxkGp
         8LcDbnfKTBBtNOBFtTNJyBB4Z6hz6gFx7KcBswFKKIl9Ff24WpqMZuoUrdgIkaQaYx8v
         YGCvkabYRck2AnffVEjKmOJlq3Jt+RDxSJjEIdFODInuO6KWvIrgcXegaGj7q1SRNBi/
         oAGOJ8fS0gPcsTb0a5DZ61sDx9jWE4so2uxXIaVYoMtNYs357AuCLQRyIcyk2joi+ROw
         p+aE8E5Ih6busmWJ9LTq8wmTybkDHkfscTdL/IxKmjruht3thFuvZAWTnPmC/rSKprg2
         buZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745323993; x=1745928793;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R+uEvjm3W1Mv9sborJNH8uTHXI0JDlmAQqTkyMWbehQ=;
        b=KHhpwAkyNxPXJ9ywg15j+aqbYyiAOfN0VWp9+47B2gLY/wY5HdifNSoMb6dHGTI214
         CI4gMlVNW1iVIsUIfz2yZnalCXne/B1N5FEJY4FdiBK5qEpoUxO7RjLvuGCWzc6c9WHY
         L/420ZBxkCWYV5ly0Hr2Ep1UENj66Odb9sRQlXfOkPTxQcesROX2KY9khzUn1+1ZMpx0
         qtEuNrCYnDwaiXB1rx5wBB2I7WdqFOhKX7yE+AqIY6z722tqrk03ijfhDyWfvDqUh+2h
         yT+yK1xHnUcje7LjK3huNoLygpEDSXK5WiF4lOSTdmrL6MfOBp50CUBG8YcqM9Z0/jU1
         d7JQ==
X-Gm-Message-State: AOJu0YzghvQb/cACggeTMi10d9QIj8OSOzoq7/PEaSLZdlK0N8Z5qx9L
	86h4M7lzPP4iJ+8oWnAPuBsm5DHLWvuZFRIQQSDqs44SfnbiZpzXpesR8+/omNY=
X-Gm-Gg: ASbGncvXWfuVQbP81kSVNS4a/uvHS6CDcwxrs3IHC/tXjSyTbBoVv7u8iBniT8h4HH4
	IQLhIlBwFTMjNkFYWxbGwwEkSijNjnJy+iLEI19tx9aKpVFqy6+nYu1Zhh66uO4fPLxKhpbsJMS
	SyBLrKT8QHwHCKGP3q5Q14r1bNv0msmfa8zMuCQbwa/9H8FnOCFhVWGAsDJIZYAm/8JrJ1WTRdy
	5pgjao0JwSapGV12NGFfqSbl5H0ElyGwsvTVfFNIPls9PjnmjaYGlkEDcKzJD4JiUZbncSP83hB
	QGLXmX/u6BtONQDS6SOXS89BTO0JhYSHVvqqv/VbH8oAtrxjyPjLMhyjBxviu25N8tpmEx6x01W
	NhMg9G95U6o9h1bcsVg==
X-Google-Smtp-Source: AGHT+IHCdLHJXHFmqzRwlauNx1lUbKvNFoCFYbXRUe8L8AzRhWbDiofTzxnFq1ebCtvwINLPkXLXAg==
X-Received: by 2002:a05:600c:1e10:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-4406ab95a4bmr147544065e9.14.1745323993335;
        Tue, 22 Apr 2025 05:13:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9eb8sm171356085e9.4.2025.04.22.05.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 05:13:13 -0700 (PDT)
Message-ID: <04ea8702-0298-4e2e-b466-8811e5788134@linaro.org>
Date: Tue, 22 Apr 2025 14:13:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: linux-next: Signed-off-by missing for commit in the amlogic tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250422212406.39ac44f8@canb.auug.org.au>
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
In-Reply-To: <20250422212406.39ac44f8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/04/2025 13:24, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>    0d057d35f371 ("arm64: dts: amlogic: S4: Add clk-measure controller node")
>    72e295292d3d ("arm64: dts: amlogic: C3: Add clk-measure controller node")
>    bc93a99ba90b ("soc: amlogic: clk-measure: Add support for S4")
>    67c618a5852d ("soc: amlogic: clk-measure: Add support for C3")
>    97533fc48892 ("dt-bindings: soc: amlogic: S4 supports clk-measure")
>    e5635febb4f0 ("dt-bindings: soc: amlogic: C3 supports clk-measure")
>    ac2edb9b7bcc ("soc: amlogic: clk-measure: Define MSR_CLK's register offset separately")
> 
> are missing a Signed-off-by from their committers.
> 

Sorry about that, fixing that,

Thanks,
Neil
