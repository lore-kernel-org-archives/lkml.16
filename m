Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC27422A4E8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960970; cv=none; b=bLCGM3i94nVbhNP0XhgfFnG0Y2yCutlPMurXazMeRPQZC1hgFzB2soFAJ6iKgwbWHvDfRSM40f638oeQya85VSbFCIKPyKMtn0gUHCrrSv7nknXPQg5grKjw0bwKR35Lcy4P2ivnh+JXxJuVBRoC0Wk12QkzshZu5WAk0UITYss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960970; c=relaxed/simple;
	bh=w3qJbbLFKIlr8IPpz61OWbLhA8Ojb0Iq6R/Q/kcUNfE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dP4eyR/n+nEflbmwAWUOnfaAWNMy/H2Xa20iV16EsV6wTLnNiaI8lWSETetIRzmpTPqFSdMmkxUu/GcaM/h69edSzE7itpexhpH19fKHQ5ehINUnnyc9M/BjsFvauCYGifNgiq2R52wxVKwNOHaeOqJpvLLc1HJbs7WA49Z9vUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qhS66DSC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qhS66DSC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso57742275e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748960967; x=1749565767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w3qJbbLFKIlr8IPpz61OWbLhA8Ojb0Iq6R/Q/kcUNfE=;
        b=qhS66DSCblxDHQ/+6QqutjtGeROiPt1Qf1X5jnY1DME/xSClLc33q6/h5Le1W62QKz
         8cRcdBI4fwk/r8I1t1pk9SXPXXUUdtPvHtJ3ehvmfiG0PGfcidXORezs9oK2zlgHSjFO
         jOquDR2LLAleUGz9JBJOQ6H8jcA7QzoEox5OZmZk1nd8+qkTGgRbYp52/mfVztfwYc+7
         meesWt5V2ymyalyk0604nRSa/8otRweAF5kfGhzPAYu+ZZ/RnXT45MgGaowK1xgeVROT
         VsS/CQqDOiVte2PEUfLCyr4SpZYA214l9jNyQfb+6LArGXhLL5OSh9c/Wb72AI0vVvgh
         6dQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748960967; x=1749565767;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3qJbbLFKIlr8IPpz61OWbLhA8Ojb0Iq6R/Q/kcUNfE=;
        b=dPez9+koll3GrYF/sD3HTYP8OtckeEiDXAikM/gV1ReTLkn9gOj4ZpTIrH5gFEOw7o
         pg7QhxX6AirPELWQZ+42Beq5WFo9gkxKke3ANukb1UMHHlwGRVQ+pheuxeXEP6mEALWf
         3gDnsl5gotAcSEub3zVQc4Wxf3/VHNq9mLx7hdmhBI91VC+jIL88Xch/Qpe1H3fyCsoV
         FWvCjoBOcnHYERgvw1kfXM/C61sxp9wzEoq85H5ca/eQwkfk4S4l+zu/oESpSjSYuBog
         N5XKsCT93rJCyYByzdloMY8NHQIWnAMMrR8Ry+IEYZkFSsSV3ZYv5Ihl/Im4t67nFZb2
         IsNg==
X-Forwarded-Encrypted: i=1; AJvYcCU1K3WEYdkdOvpuaTmFzp9mOgIhVcnJPpkIwMObVf/emKqTS0AnVSYxFFyaFedpSQG9KezdQI1XiCw0hpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDpPdJkK4EQCkkdLmDeHJc7OvQRVaNjsOikVk7G89Hh15q02I5
	Yw7HVl+d1ADepIFeBUQ6eeXfKZcUb1/tCCXfYDJBTaqpjQ8h0l6HjIb3ZUlTe1UtNX4=
X-Gm-Gg: ASbGncu1g2+YJdHMcKBR5O/D0gWaJfO8flHMZ6WpqDAiP+XHbTcw8X5RFNCkXE7K1D4
	cVJ3t3tvgZ6bY/0JMwHA3stHwgzMK9E6+aMe8caO5TpVGQOwShs4mIRlX0PQiNKRlLjHX9OiZQm
	aDbNmXBls/4SXj3shV/bC6Ook8npfQBGru0SWcgIl7fdM+H+Tq8zkV4YzS3VrfgZwU3pTJfMLTb
	9Q2hq+ZmpbR/TWA+KbG72AuEvuclPLqBytfSuUvj17E3DpmbTsSiQAUFa1ETkSm1/hL0efCnbT+
	AwcfelmGiAlkw1hbF/2mfj0N1XP3b10NDWzS/VF4sKciIcYc1XyBlPTpHpm4Et+uaa2AtagJfoq
	SmEIxCC7RKs+ZvGqO
X-Google-Smtp-Source: AGHT+IGBJA6javCrcGvDz9kgjIx0gKy0MSn3MwVpuFlPN9NEjpfetf/hiQAdNxpchZl7GR3GtryIaA==
X-Received: by 2002:a05:600c:3b9f:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-4511edc208amr131076915e9.15.1748960967166;
        Tue, 03 Jun 2025 07:29:27 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb8990sm168262475e9.32.2025.06.03.07.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:29:26 -0700 (PDT)
Message-ID: <afe41159-00e4-45d1-857f-0a68f6fc6c8e@linaro.org>
Date: Tue, 3 Jun 2025 15:29:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] serial: qcom-geni: move resource control logic to
 separate functions
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <vTOsjvsB7oSpu2Oe8i1ufoz5C2Hy3EtfDnfBsLag2p-s63J0BLdqbLn44Hds17WR12JGfo7sd52k7uHaXlTTeQ==@protonmail.internalid>
 <20250506180232.1299-6-quic_ptalari@quicinc.com>
 <f912588b-fb54-4257-a4d8-db58e93b8378@linaro.org>
Content-Language: en-US
In-Reply-To: <f912588b-fb54-4257-a4d8-db58e93b8378@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2025 15:28, Bryan O'Donoghue wrote:
>> 2.17.1
>>
>>
> Assuming you address my points.

[sic]

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
