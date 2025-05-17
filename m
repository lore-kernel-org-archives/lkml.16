Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193DD2066F7
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747518098; cv=none; b=Nq6oCRei5av/34YEE/ENmsx2kfmDACOD07/a9k7UzKufNLoiZmSaT1LIN6qsSeNeIKxbrmoKVkzreWFSgAMZ+DTGwSY2spwonHsB8HIC51hNlrU5C71I582VSv+6lfO/p/iaD7s69i2UKzQkxKYO40711J+qZFokSQOQq2dZ1Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747518098; c=relaxed/simple;
	bh=rgf3AmO0KzSB0QITDvORX+Y0fa0RiFi81JHdrxxkzEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twrlhD5c8qDnf1O8SIfSclr/ZsH/rP2H68jsI5Pb9NvaTf+TS/MbYJAjP6Uao4YhXEXaH18QsX3b40cHLF6IfEi2AuqlvEwZU4HE+fKjRYMeIfErCSseYxBlf4D/8CjS7CjpwXOSPys97JfyZmIO0i6/0uTcBvB8vm11uD95DEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsdATuH8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsdATuH8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso30912725e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747518095; x=1748122895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bY76AEEcyf1ZaP0Q4E8CqeVAvvQqjzY+efsftGL0QMU=;
        b=gsdATuH8YVlgoetNJoOdL4qdoHuo7aeQzZcjQfwhholFOFSiT48g+ir1YOpkAd2Gix
         laCenLPlpn7Dq7jnLcpBijYIZVbricScxpaAqyBm3DkmFtfiwlO5azXswn0AYQpz8S2G
         tW8LKo9CyKvMnBswbMtgI/I3i1Q6cUiuS7d967NGSUETHQ4LseNd5NrQCChl0sgijZk2
         euw+D4YX11O3FiGGN1YC3Y1FQAMeQB0WomsSpHz9O4h2QaUsA+d8mBOojDBR16rgU5JD
         m8hVU1l72cUq/3ubTfQ+AfSTjC/psj2iz2xunUX42qPEGKzLkV9Fxi8NbHspDWtVVnaL
         MsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747518095; x=1748122895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bY76AEEcyf1ZaP0Q4E8CqeVAvvQqjzY+efsftGL0QMU=;
        b=Qn+frerJAQkAx5VSLc1l4Adl8QmWYLzI5sP6OF46y160KwJTfZ3ZItARdCl1dnRZap
         WM96cKHlqsOpRUuAaYsLS2n5yw2auRvtT++ypVHFIn55TGK/GTSSmM7p6L6INhamqSKW
         3wnUnixF1XhIK1zW/qv50kYytD55H18ln0KPgFbMeRHxDC/BpeXUXyjEmtOMhq1Tr/fr
         F0nKnliVUO/1HJnJ8vteXGbYZWiS9IiCJThtVE58FiRPQ5z7bxnq2faSxMV84sGngBaf
         XDzjuGhyqLeeFdzA6XAN4RnX0W6cci/g3veLV1f3EohXxfrz9KTw3Au5JrO+gJbp0gJT
         mYGg==
X-Forwarded-Encrypted: i=1; AJvYcCXm5D5xAJMf9Ugs2n/tDnIwEScKAAFSN49pBOrjF83MDyrcJ4D+mDT/2rXGB+3Q/BP5jMivFlpsoIzNiRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOIcPVTPjgB8EqNa99x+lwCAvpR8fF5YGhF6yKZfIb2t9GuNw4
	zNhwccG2cbSwgTJGnBwDbQeJVsbCDP9iP0aaCJfCnUvAi8sr5cPRBvh5kogx0VYoHTg=
X-Gm-Gg: ASbGncvhsYvM20uXcGsleRzOPII/7W/RnugQ37udQnlqS2FY7LPa90EkldW1KfiPw+9
	IHtvE4dMAFPZjD1L4ZYSePENrtYT6ZTpWIeYQr+55JpxASMcIR82IArHfGq5+tPTekHPx978nsC
	F4xhb/bcE3RuP8pZy5ft3wvNymSbHNUCpX1hDtdZ1chtNZ4R6SdLrykx4FItzDlAy48HmIpr/yx
	Cxkxf+1ON1UFU0BJ8uBym4co5lPWg8iY0qL3BciAca/GevdsTjbDGsCtDvaCJIj2rfnP2JMUD48
	iQFbiFEydkgSL4oFIP6fHFlqpMqT2ATc0A7XQyOp9pbY3fRWIH4FShGI4e6xNXFHO588YdOstgF
	xOpfj2T+hP2GerbEG
X-Google-Smtp-Source: AGHT+IEfLRMthem1h4Iqf+AVyw92a10FVG/gJvB+jnvXapWRtPRHbKjdboZGt4Z0ylILdnQ8uegkeg==
X-Received: by 2002:a05:600c:a105:b0:441:ac58:eb31 with SMTP id 5b1f17b1804b1-442fda3038amr54007955e9.20.1747518095254;
        Sat, 17 May 2025 14:41:35 -0700 (PDT)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e852fsm163281875e9.27.2025.05.17.14.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 14:41:34 -0700 (PDT)
Message-ID: <f39310ec-ff30-45b4-ae80-768f252b7ed5@linaro.org>
Date: Sat, 17 May 2025 22:41:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: venus: Fix OOB read due to missing payload
 bound check
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-2-32298566011f@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-venus-fixes-v3-2-32298566011f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 14:38, Dikshita Agarwal wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Currently, The event_seq_changed() handler processes a variable number
> of properties sent by the firmware. The number of properties is indicated
> by the firmware and used to iterate over the payload. However, the
> payload size is not being validated against the actual message length.
> 
> This can lead to out-of-bounds memory access if the firmware provides a
> property count that exceeds the data available in the payload. Such a
> condition can result in kernel crashes or potential information leaks if
> memory beyond the buffer is accessed.
> 
> Fix this by properly validating the remaining size of the payload before
> each property access and updating bounds accordingly as properties are
> parsed.
> 
> This ensures that property parsing is safely bounded within the received
> message buffer and protects against malformed or malicious firmware
> behavior.
> 
> Fixes: 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware Interface (HFI)")
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
