Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B021547E7
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961995; cv=none; b=qpudpMADHV3k6ELjK5MyvhvTovFkyh04ls+qPR263gG0vo7XTmwDTzn3LtIqUXbVqvplAIuLqVtif0JaH82FG+GQqHcT8TZhY764ZM0Yx79XlY3u74/g2jY87+Wzc7xU0G8h3ZmxZA6+Ixk/oZL+9SDRMww2R/VKgfxILuOnqc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961995; c=relaxed/simple;
	bh=SRrmvMmAfQ84Yeq4WzNWtCU8EkhCciiw6kJXyYDeUl4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZZnGoVlxpJq3Ssp/s7iTW3Rx/IE06Ec19myTiu9PCuH6Q6FZFSrXwXjNyxrCnAUT6dpnLhjYS/4KiPWoxn7yHFaHV/F6IKVAJp0YsOaA/u4Bk4uO2nWDB+rLKuKYVqQGO7T9DbRvrRJL/djPZuQIrYA3xWtvSVBcMb2aISBT0aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cf0rRyWh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cf0rRyWh"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a375888197so2949138f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748961991; x=1749566791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrRmbG4/N2m6vRayn9TmhHXB4wgb2uEtyKQ9Mx3XTkw=;
        b=cf0rRyWh7K7Pl+yc5MBiK8yhGgdhzximhrDHXfLgWxEOVKaqS7b1+e38sNqLbj5j24
         8XI86AJ5k+lj4YU9ry1h4X8/+/YWQWt/mTka2sQnSrlbfiv5cxH4NiexRbPl44s3/Wjk
         eiVSWq08ZHVTIYs/nzFS5VYcX/ob+1vW172H4yrAlW0eTyDxosar8UEY+4xuBm99LeXO
         TBMc9+4iJAvJLoNHOe7UuzVmEPJI7KfFfMCx2TeZxaXtKv/oSJdMqCfbtfSdaYRJrLJZ
         klQdSIaNSK8vSJiGHhurwqC3jFiIhcSsM3BJSzVEsFZwNwfCP1VmrvdHf5nY39bk5oxh
         r5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961991; x=1749566791;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrRmbG4/N2m6vRayn9TmhHXB4wgb2uEtyKQ9Mx3XTkw=;
        b=r4ZxbbwubUtarOMcqjsRui/dvGfXyeEB9uccecXiTFj2Qgrer4xyfjGkxAGZzSZ56v
         szb00nfCP0AwIhVmVfkftUdU4jyJ5DLNBSAUNeISWduIuxzBN3mzE6Zl0+XyB5apOKnI
         eivfWKoivY8XdhBKQnXZFrJwTfQ6soEXUdlRdwvuR4+8dw+KK4mXKcgAeRzXNtcF+TU2
         GAC7uUWPyhvDjaKe0Qo8i+txRz6MZuFd1bGZWU31ZC2ZFjMOZbyzmPAkcF4K3hhVZHwd
         l5t9Zu6QovYdOuv4TJTP6rlwMvqxKP3GKjSHluFcwdneZr5Ur4ijPu3S/YtFpT0Y0yt0
         nRCw==
X-Forwarded-Encrypted: i=1; AJvYcCV6o0wBqluXgXLSIjT7qYB3gD1llHaw0Yl7Z5Q6NegMY7q/XSFoKXF40IYOOY56612E2qrA2xRpJ2nSGhI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9SnUIAe3fAdikxGK/YgGiBMldGZLVYp0mnGJRYP2E4SuXSdgU
	9uwFFSJxv5nUMzc0cvqe11mrDCVuKiRCYZEw7XXw4iTZliw2OG5gz4o4N7i78faaens=
X-Gm-Gg: ASbGnctMTW9Skp77dbgFyHaukRhJsxYRYq3Zp0CGlJyTHcIud7A+fkXYdz/P0O1Zs9T
	DvfZqaqpeMsCBDKmM2Rs/aqB7yhulJglIZ8iFkfDdUvPCy35iX+/jqXE0tphpL7mgEhQHNsWpHf
	jiqC725HDNgCxjHUpG5R3hM2OiogO3IC9VAKQWWeHdaWKJHLsfGCOlGhScZOFduZeN5ftrN7/Rf
	3AYgJTbUZfi7wsySPQ7522YM8gfZEQW9tTWqeQdg8VliWXfE3tEMd4iWMeMZ+L4N3JRTltoNHPx
	N8fU3Zy2g2QT9ZByKtl5oW4S826T/kVPyX95/akpQTToQPV2Xp39Jzp5Cz5FyGNKaSW1rJrdgpz
	0zPS5OQm0zr5wrOeX
X-Google-Smtp-Source: AGHT+IEwDI4aK9ArKoZhrl7cMJOHsOARjxSQuD4nPo7SSj+7IEGKJEEdNhEZIdVtyzFuUtgXO7lmtg==
X-Received: by 2002:a5d:588d:0:b0:3a4:eecf:99af with SMTP id ffacd0b85a97d-3a4fe398ff8mr10830056f8f.44.1748961991228;
        Tue, 03 Jun 2025 07:46:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b8besm18722647f8f.16.2025.06.03.07.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:46:30 -0700 (PDT)
Message-ID: <6b7ca51a-241a-49fc-8aac-da5af96b5e10@linaro.org>
Date: Tue, 3 Jun 2025 15:46:29 +0100
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
Reply-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <vTOsjvsB7oSpu2Oe8i1ufoz5C2Hy3EtfDnfBsLag2p-s63J0BLdqbLn44Hds17WR12JGfo7sd52k7uHaXlTTeQ==@protonmail.internalid>
 <20250506180232.1299-6-quic_ptalari@quicinc.com>
 <f912588b-fb54-4257-a4d8-db58e93b8378@linaro.org>
 <y41ikVJ5uSSaGZHmqsvTm9akz3EUUT7X6dTPrfSuIYqGmMdlEfPRWqPA630jmsEzwC-6JSgYRPobg4e933PgxA==@protonmail.internalid>
 <afe41159-00e4-45d1-857f-0a68f6fc6c8e@linaro.org>
Content-Language: en-US
In-Reply-To: <afe41159-00e4-45d1-857f-0a68f6fc6c8e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2025 15:29, Bryan O'Donoghue wrote:
> On 03/06/2025 15:28, Bryan O'Donoghue wrote:
>>> 2.17.1
>>>
>>>
>> Assuming you address my points.
> 
> [sic]
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 

Oh please fix this in the next version

checkpatch.pl --strict mypatch.patch

CHECK: Alignment should match open parenthesis
#92: FILE: drivers/tty/serial/qcom_geni_serial.c:1675:
+	else if (new_state == UART_PM_STATE_OFF &&
+			old_state == UART_PM_STATE_ON)

total: 0 errors, 0 warnings, 1 checks, 71 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0005-serial-qcom-geni-move-resource-control-logic-to-sepa.patch has 
style problems, please review.

---
bod
