Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52852221D94
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748946984; cv=none; b=jME9JzbwWTKeZ9X8h7s0agewb91WZDx5POEhAXA+e8BKXu8lwOytOpTe16tpBbCZgIzp6UjEympWPCC4xZc8ypC7IKce54rqx/jSaPwjQt68dFbJaldzaz9J0fyS5vbuQkGzzjYSAn2kAiQA7hx8FGj1iKpgiOS+tpRl8VnghX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748946984; c=relaxed/simple;
	bh=B2C9BgAqReCdeRDxSrm44sZV5lD9PnrJrZXV0mxzNeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cnr6HMxij/Ya3s/Vq8Mwr1VAn/0ubVOeZ9opsqQT+HPK9AJvrbhedleJiXnPF19qsMWIuMqQMmjmQ/EE9OoJCwx3demfxdg5lpnRer//1AhO2LAMJXfC8jX7D1JAm+33zF+YlGlIKdXW3+Kl7qc81kZ15sBv3iIQQwjVe6tb1R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ua3mLTq9; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ua3mLTq9"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so7641887a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 03:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748946980; x=1749551780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2C9BgAqReCdeRDxSrm44sZV5lD9PnrJrZXV0mxzNeI=;
        b=ua3mLTq9JML6XRzTHPo7C9JeC5wJgpaePlf1xE9fANKXJwKYwUjcytLKzip8LIXxhe
         iNjmM7XoScTXfE1301733SCMXFr/7xG4io7TqsOJsiOzjHraeZlKGWcp3jjY0tzqnr9w
         FMWTGL/wgLVR4JV+qVsJCMRr07QnlBqQtA+/BDmgnUkZyNNXmTMt4vvk+vi6KghVOgCB
         pfZo/6HdCweRj67eXmWwbY9Hv+R3FRWxLCoZh5NwcT8r8ON3ovsnQbax/wfVEaWtZzY3
         XYLKP4WU06+zxM4OSwlwP8Hl0fko/yVcIB7RJdG6ywwNZzVbe863+wRbqa90rEJW4fC8
         2rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946980; x=1749551780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2C9BgAqReCdeRDxSrm44sZV5lD9PnrJrZXV0mxzNeI=;
        b=dsihPDQYbZtiP3XI6jVgu7Quw0/Rq3pJwDvAaPbOZ0m69Fd61N9bwvwExjaJcGWBPA
         7y4h1HqE1wCnGPYJUpU3hFRX0Tr/4B8EeAZqx7lSkbymccyTifhZNyb9v3Asa3dok6bX
         +AuM970QZlAVtrRr05UBX+giY/mzeNd8uUBJN1ePIkDLrdxT6H0t4mhVo6dP0Um10qnR
         VT+TYztAP8x7+zzONWm5lfhp4sA7s2mYWnwVy7PLUMYFgJUKED2h3BAEVNKpmUdosi/c
         M3SHkeeNpsobv1WAlZRd7e03vUUQIigPkyBjmNFWhA4/gzS7uA8lK77FFHdziLpHODQR
         WKqg==
X-Forwarded-Encrypted: i=1; AJvYcCV4Bf4moba9QKQtPBZqW9PN+uu6UKkWm2VQwxAJJwCGpw+oCuNXFmGqdwY4XFNFatciF2X2Y7nguXjQ+CI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmxhrGl9nOQXdaA31UP6yYXlbtGB2pbkpObP3DptemG5aY7ihf
	jw/cOmsYJtVtntWwcQjqnPzB1r1Sd9OAUjzy3Z6eRHTHF5WMg2et981eAe5CQQ6oE/Q=
X-Gm-Gg: ASbGncu/nEenvTEp0ZkgiDAf5Abe/2e53v5/K5TG0XDIS5tiN6ZorAoSeCt4LUG60pa
	oC0igrf2PEsUH3sj5HeZhaqONV3EsgKMvXDoJDFZ7oPboicGgugeofInJAHhmGyI+XW9mjEGLIe
	MlO4pMDDSFt9YB4AlJfwbUkcIPIYVOJGCftjiu3K4GJnJRRjHyH4c8570ywQl3b1FjIb7eN5y16
	TJjepQ2YfI4uQNqBFa6Yn+3JXVpxZvhQ/Z4N3EpInyMwy7+vzNpw7drhXdTgPcJ6k3esl1G/Z0N
	A+0DD3Yq54Alwr+qieJ5XqhLo8JrKXGimbeE185C9V346ySXoymPrX2kSIcFnvQZwu40ezk=
X-Google-Smtp-Source: AGHT+IEEOIwO9iYjvfZYF8EOlGVmtp3rgbjYInA5UvR68VMv0PsLVeRljm+gihGoxSVwTebIabNwlg==
X-Received: by 2002:a17:907:7b8c:b0:ad8:8529:4fa5 with SMTP id a640c23a62f3a-adb32580593mr1954971066b.46.1748946980532;
        Tue, 03 Jun 2025 03:36:20 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84e76csm923484666b.86.2025.06.03.03.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 03:36:20 -0700 (PDT)
Message-ID: <c1c0bacd-7842-4e9e-aec4-66eb481aa43f@linaro.org>
Date: Tue, 3 Jun 2025 11:36:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/25] PCI: Perform reset_resource() and build fail list
 in sync
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 William McVicker <willmcvicker@google.com>
References: <20241216175632.4175-1-ilpo.jarvinen@linux.intel.com>
 <20241216175632.4175-25-ilpo.jarvinen@linux.intel.com>
 <5f103643-5e1c-43c6-b8fe-9617d3b5447c@linaro.org>
 <8f281667-b4ef-9385-868f-93893b9d6611@linux.intel.com>
 <3a47fc82-dc21-46c3-873d-68e713304af3@linaro.org>
 <f6ee05f7-174b-76d4-3dbe-12473f676e4d@linux.intel.com>
 <867e47dc-9454-c00f-6d80-9718e5705480@linux.intel.com>
 <a56284a4-755d-4eb4-ba77-9ea30e18d08f@linaro.org>
 <7e882cfb-a35a-bab0-c333-76a4e79243b6@linux.intel.com>
 <f2d149c6-41a4-4a9a-9739-1ea1c4b06f4b@linaro.org>
 <19ccc09c-1d6b-930e-6ed6-398b34020ca1@linux.intel.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <19ccc09c-1d6b-930e-6ed6-398b34020ca1@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/3/25 9:13 AM, Ilpo Järvinen wrote:
> So please test if this patch solves your problem:

It fails in a different way, the bridge window resource never gets
assigned with the proposed patch.

With the patch applied: https://termbin.com/h3w0
With the blamed commit reverted: https://termbin.com/3rh6
