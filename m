Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3F3946F;
	Wed, 16 Apr 2025 22:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744841108; cv=none; b=mItgLhPgQuwz5cnBAGkInPRskvOIujKVmw8r5nT0o41ktBuWUEiBF/sR+wSKTCEetysFHCl6BF339GKezzvp033eIpo1c99utfEPIlh2UtVWzvhHS56yfbWXJw4cUZ1To7SiaaEkUD8GAoIiSNIgwtPQunqlfuC6Sv1Z6WTMyDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744841108; c=relaxed/simple;
	bh=qCD1vFXSI3zBOXBAJ1SOeNHV87e7EHRpPPWphDyj5AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S48EXaNblCGImDRorfDXLR0V/4oYZtKutkIqOBhx7UhJM7bB57lV6V5TiFkYiFeo1OZujYaVgb8F8VihmaQ9rTJavfB5gJE3kvxIudG0DTy6HO6mkqn/ElLJTf5LEw30vjVGkeYezRD7jN4n5j9MO4qUjGWRy5niCY93fAJKfWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWrqmVrN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWrqmVrN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf680d351so7439865e9.0;
        Wed, 16 Apr 2025 15:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744841105; x=1745445905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHayVKFFsJNmr2sjJkndFwEOAkhvbxML2QrMhdj9R5Y=;
        b=YWrqmVrN2DuZVjPDTynWo0W+ej4hqZrevGcqQyOi7faWWlpTYpAzLIUDrWsL56IE5Y
         jgPrCAD53XNxnucglg2swKjkZnAXMKF3D9F+wM0mFKIBTBuU/EJ8SdjCJEOHFkVhVCYP
         kkuH6lX/VhQaOi334HcOxJ2ftBMXKkq4Gua5WpfQiZzL7R2MbAhy+4fh5eiar8lBiZUB
         bPrh0iPtrhEghgAwpJzQWTdVuWbq5Xg7cdXBQHlburpig8n/EHRvqAseYwVXm8Kg2lvi
         /oSxObMpP3ugjOC1N0qNPj5DFzJl7pIOXARdrpiTMXw8UoWVC0lGkEVQtrXSypSyGbqP
         K0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744841105; x=1745445905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHayVKFFsJNmr2sjJkndFwEOAkhvbxML2QrMhdj9R5Y=;
        b=ODHSTZdn4Tb/IE+aFYjL0rMd0RfSiLZLBIT4EiWIVkqG0GaOCrmkbDqygBKrfbCfQ7
         1qZIZBlAtqxvhgecsuXxukMDlhWDuKS1LN8UyrnJ9ojuqWUXxfn35v3mdNTiKbzxRcdL
         UC7Nogd8UWFL5ukomn5YK3uglRNu7K7XSVB29gk46zH4tQYEwvW/jGgBasOXEFb0VQx0
         Z3fg/1i/LzjdKXIadMIp0JB8nmc9M73hWw11wI5Ie5ZwMbDYnZRDY7HnFhchqe99O6QV
         RtibIs7UKlSZwlaAhAWFKGiY2rifxHmJx7/eL+XzlzItjubCg4sHnZFSItFJsEvtZfth
         P90Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBccjJW02zMVr46aZk3lNnK3dKNQdbOzAvXmrM2nv2p5Mlfhm29Qg3qImNvjjrio53GVLJ/uazuSB9mMA=@vger.kernel.org, AJvYcCVyw3z+s9DvJ1clu4TREB/MOevLAxkRl9/udMRl/vTt33LoNLonw7IThSgEN9ZLtQ41iWmW2r/R5cTLRBU1LQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP6M1IxXmaOijE0HRNR601KOKBQZAPbbsGAHdUPHlLCyMnvVAb
	tGQPJHxUyuNrZAK+NyUtSgSa6MNHtOX52/KkIKGAKtMOGDqoWrEX
X-Gm-Gg: ASbGncuN94g11MqsVtT5kKllAeu0IDc7no/u7idwPR20waVX6JG+q5xlROO2FlZcxPD
	MDvscD+Akigvvu86xHwE4qQkMyF3+awpirn5/hfvgA+vLXLUgOU3AewS2Et37IsZWk8bOKijhv2
	XmltA68zaxJfm4j4UjTH1097lplatg8yP1q8p3mpTFJ/q4GhV5LTfs+mFim+Y/2rXtJqzIg2hG+
	8wttBOR5jrWzztqJPT6f4H3KGhAf58oTSKg8sfXD2N/bP0c7OMJ610Yj+7AxX8ufZTgrypSaGvO
	WlxZoxRd3hxL+dpyNpJxQ9l4AfqRzJKxsCVfMLNGE5IbVv6+asgrdA==
X-Google-Smtp-Source: AGHT+IGC46S4S5h4Q5ailbC5feqlplYAzWogcdOjZfAGKxveTGmXYrJirUpLbhifwMOyo43pOFOhPw==
X-Received: by 2002:a05:6000:2509:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-39eea37a7b1mr334295f8f.8.1744841105179;
        Wed, 16 Apr 2025 15:05:05 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce3bsm18546012f8f.66.2025.04.16.15.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 15:05:04 -0700 (PDT)
Message-ID: <f801975c-a796-417c-a7b2-be493b32068f@gmail.com>
Date: Thu, 17 Apr 2025 00:05:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: use `///` for private items too
To: Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20250416122106.2554208-1-ojeda@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250416122106.2554208-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.25 2:21 PM, Miguel Ojeda wrote:
> `///` should still be used for private items [1]. Some of the items in
> this file do so already, so do it for a few other clear candidates in
> the file.
> 
> Link: https://lore.kernel.org/rust-for-linux/20250416112454.2503872-1-ojeda@kernel.org/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Not sure if you would consider it a fix, but please feel free to add Fixes: etc.
> if so. Thanks!
> 

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>
