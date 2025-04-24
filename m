Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F5F227EAB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487666; cv=none; b=O7dmlx3NvJ2Um8KAkEd5jL0R7qC/KTIy2xZ1duNjPh385xLndLw+/9A/oeILiRq0H3Mrz+pLGWtNQ82MHCuKqHnzhvxwDNjK+sUYMAI9Qa/BOxgEskBTv+MI2lTBkU5IF19MqUoak+vCD7rbu8yna82hoZVDLf1mTnZRoMG0v8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487666; c=relaxed/simple;
	bh=SlgEdGDb/DKWCOuA4W5dZrzXGJJOrqjhh0pU26wetQE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QAgrtkzOKN/BgWGy0vd9dofaNzFXNREjjIfjQLSsOonPNnLtTB9jIDP4VS/iYV20YuPDH90EcWbrD8+6P+l/PaumE0crg5ukGWrAPeMUDvyzi/EV5pVnIeUVYmgovq9mhm8PJxRlMN8tUNJWJxS5jWfy2cWZ4t+BCv2xO9K2hcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JH7mhBgp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JH7mhBgp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so808965e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487663; x=1746092463; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ+2XPxe7PcUywYmBjNxkwdoBQCPKKKmxzqhiPsfSo8=;
        b=JH7mhBgpdkIiIs5QotxDvLbArt6+RlBcFlpuBtWokXbuZwEK3ZIe1sL87xBihMyfB/
         PS1WmXrTVQn6VWnEZkr0rcfoWHKilehcx+ROtOTB/pdRj0ljJgdMUmR+Y17VtUu22vC7
         B9YeT+VeagwweovGVsN1wBmem6aF/M4iwu2fkvluF0rD7jO5xHRVHb0BHwcr1oehjIw4
         ZiejLMXRoGeuFpHkrM9547ovQG+pHMzyrCi6cxO04++krKdzIumJISUSgHxOCYqfMn0z
         dsuDc+c5ymP7FC63FZm+HEVfT2Mp7S+MkarjyYPef2xDJ8LecWq1GNlWSl093NQgCB8V
         sSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487663; x=1746092463;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQ+2XPxe7PcUywYmBjNxkwdoBQCPKKKmxzqhiPsfSo8=;
        b=tn4ASIeZ+5Qxk6uvAn8xZqRvDVqJXh9Ld2ZCDnwXthirz6ZaA13bMHm0iU2nPmYE1X
         shovbuGwYW8dM9YH1rEF7Wv7sl9ZbPFFqzlGEKxRlJwwvxvu1Rt0SHt+25ZtBJ7HR2tn
         d3/sXZA++6Hh0PvFFKO23jUZj4KfsyyPx/Elz17C+5J+ZEZ6TfNVLdZ9KPjRMk67opPC
         JoUmX+gsuf4HKLE/puFK6tCsLL8uVawJfIO+/ceuoGu4LZMejSHKXycLwqFCEZMXs+08
         ixYyOUiFFdoGjDC0NK6LlbUwr9PhLV9WcsYMn8Mw8jZpCg7L8xsWKgrWnoQz6Nov6q5Q
         Kp5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6mo9jEI6/wEsLWlYIcwMLGGGsvkSDA6yPka6kJ6tjT0dqTPGXb2EZ8qG2ZhNd9D3nmvQZoxjZhTiiwHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZODlVLre9rwIMVsqEXc/jVpFV47hNBO9/4TB/o+9eiHn2bBJA
	+pMNjQYUWkCrjZjIY1mnE5Egca2Zjtw5w8IJN54SMEXptoEDKnSIdh34WN8eaXiBDuMkcsrcAYQ
	I
X-Gm-Gg: ASbGncsSpUmWKhOsy8hkGj9k7X/DzWI31bgBJLcckCBt20Ewo0nMxWL0pgGSzspqP/D
	bHqMLixQ6Bn30RnmcZH1gXny9GzLhif6mCq90ukg5tTqWn9QnJsP70EbrzP2I3Hs00L+F3DXavi
	2vlA/ArrmyDE9LqXkSrTiEpuAiSS2sw2EWJjx5zuKBpH45msC9GLXzzxkyaacM/nBzVDaUEaZz5
	JxNtpkkTcKQYYgRApRuGwSGVau2dGuWqluBQZhaD2ZvS59mPBclpwSMdnNo6kXWXHVDKrTmyVys
	C2dsuQG+wdiJmXw7sazetI5qP02aKo4iRXxuiuv2n9bz9jUUFFJNTqS3pD8=
X-Google-Smtp-Source: AGHT+IH6QjibDV6FMB7BupWJ4Rz4BI5NVCaaysKCD+vN41xLRxC6QExKkQh4znHdZzlbXnjaZqcX9w==
X-Received: by 2002:a05:600c:4707:b0:439:9b3f:2dd9 with SMTP id 5b1f17b1804b1-4409bd8c327mr6387265e9.7.1745487663119;
        Thu, 24 Apr 2025 02:41:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c8b0ea0sm41526975e9.2.2025.04.24.02.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:41:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8750: Add sound
Date: Thu, 24 Apr 2025 11:40:51 +0200
Message-Id: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMHCmgC/y3MQQqDMBCF4avIrB1IRiXaq4iLYKbtLKp2oqUQv
 LtBXX4P3p8gsgpHeBQJlH8SZZ4ybFnA+PbTi1FCNpCh2loijJ/WNQb9FmTGxeuKhF1dkXOhbSp
 DkJ+L8lP+Z7UfLit/txxf73HfD8cfh4J6AAAA
X-Change-ID: 20241122-sm8750-audio-part-2-943277d85302
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=800;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=SlgEdGDb/DKWCOuA4W5dZrzXGJJOrqjhh0pU26wetQE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCgcn6//8BzPKJ5ntOP4kIjJna/umo7zZXjkJw
 YPNlvQwV/+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAoHJwAKCRDBN2bmhouD
 1wMQD/9x8PW9l3kJPQY/9L14kgJnatrwjcxMjYYZqePCWUYug4mPdT/q9/688blJHqEH51qjqzy
 Mz57BAxH05nRbTSAzxVj2lSU6itcet2HNgllGIua+DxrpwM9VX8z3NztpLfrXCSS627TI1tz8Yv
 /p35DOoGHdRX+yRan7s0JY21a6w+mPidbPCbWqrXCB333j6wZDxJ1JMQkOTM1wZ+TTQu/BIcEeh
 HXCCiARfIVlNjw4u2yqO4uaV6JEZkgLcUu/Hg/srVVaG0W/dvsncpGyoDAjY23Kv76Q87wiCzKj
 cATqvwNT7H1BHK0EF0jzNyApWl2oice+fucYMIbmKyEwIsn/30tXKDrpoyt1l/1jk7M0rk0kLE2
 9PHULtjz0cAg4QBR3ZSVVtcTZRkh82QUlb8UQH9ZPqKpdZIYdnEUwH5ty4kKbdZ3F3nQY7+FN6U
 jtKDb9tfqB5GiNuwsGjo6Cq9bzwk1d7Tm1F63OOIsQxg6GtJPmtU98MnxAToTPyNobeikvPr4X9
 De/NC0Hkxpxr6gaVntcqsg9Ebc+LzHh0pE5LGQvRa4jDtAf1zJFYDfPaDysaXNLiQ2vGsh+eMLw
 H+noh3CcVqUGb5FjgXUc58ohCPgUDUs57UakEtljVYgmBH+2EvNUePbrXLeNQB0RAmZ3cB7nC6e
 /rO7ubk+5n2JKMg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Dependencies were merged, so this brings the necessary sound on SM8750
MTP.  I have patches work-in-progress for QRD and also USB headset, but
this have dependencies and need some cleanup. I will be posting these
separately.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      arm64: dts: qcom: sm8750: Add Soundwire nodes
      arm64: dts: qcom: sm8750-mtp: Add sound (speakers, headset codec, dmics)

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 214 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 122 ++++++++++++++++++
 2 files changed, 336 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20241122-sm8750-audio-part-2-943277d85302

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

