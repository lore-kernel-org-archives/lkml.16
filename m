Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5276E204F8B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589006; cv=none; b=TWpAjOBx/AofzS7Cwdoty0+UJOJdlR9gJ3SJbsFQX08vf5nyXFnCPT97acdaQzTqXCJb2U4FFuchOx/ogScKE5FVL4TKhJbUTwvaCdZY42SnP7ZPGS4q82rK+VtJSax2nK3zawDHgwpe3IesekreV023eV75l3tEHTQjkoaF+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589006; c=relaxed/simple;
	bh=cQrv2SqpUl7InSRqNh2aggA1ZtzP147tm85RdAJwW4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oL/mOH9lj7cJ6NYY5g2TUBJG/tfNATKQTgloGo/cxdKwxBlWyR/LSWTE15jrYGDOY9YY97JnOmtsecmsMuxqNK585sO7LAJ1zfxibFld02xh60XGXWY9bDwqPqlR0H+q5PcZk+cedHXU1n3lUke90VRgVQ1Vs+JyZ55sm1kSCe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PxHgEq+6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PxHgEq+6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436281c8a38so31107795e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738589001; x=1739193801; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SidIMQ+TcWPZhwjq7NYPUDFpmffy0JRNbe4lk/zAxYI=;
        b=PxHgEq+6gDCeq0NSCtcqPCyNR4jOFl/XRmzaNKRtynAzQVU4S49+VAIChl2o4W1z/L
         g/7drXY/kHZFXhjdYQzn0fo1fOKRiQIgfS19AyBpmEGcFy34JBVwrfvBj6fDmUkjPO+1
         mPh0DH1l55dJZjEon5Jpbo4gl1dq7jhvytwJGqmJEsfUQZVwrAGWRUESTwKRW9ObY8xA
         pfQtoPr/trPWYsQ4mXiCG12HgfuBVujwCjcbcGvDqbmStGRW3jeSFcyrMEX1RDme3ac8
         kOVBJQc3Ls1+Y6KpWE7W5/9ovIk3V1OswEm1bFi+AzTqikOhx1RHHvWVwVNtr+fM+q4k
         vt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589001; x=1739193801;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SidIMQ+TcWPZhwjq7NYPUDFpmffy0JRNbe4lk/zAxYI=;
        b=HJeNGwtf1/MzoxYv3Ck6KQXmKV+smputO2DJKV0QBveIr0p2C+NLUeKX2wfUr0gpTU
         1FV73en2X5uUNAphjFhb8xEEePmZH3/EoZb7pLij0v9EH3RzoCw5c0gb9IXXKPBmHoNr
         f3xx9IXBThjM6NPk7Fm84Fj9BmZzmuGaINNblvunRHPQ/syWJv7O9Y78AxjhRt4Z3cLZ
         1WtiP5T3Oxeck7I4YZAAqhVyCaGJ0q+8kGuX9yEVxDYutD+YTemKuGo//BSs9cz2TNN3
         QGeSGH/ah5UEO4MC5nQwAXx5XhqbB3/nDuewH/7PAna/gvG3rY38Uw+/yzQPm7qnz0p7
         2qCw==
X-Forwarded-Encrypted: i=1; AJvYcCWh0mBhHulJ9xxLZ3Ghg70ohA9z7vlEeHgUpU+DGH3aLnx+OdiLQBVVZu9JkYsVsBRf6GPz66bTwgAvB5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHq0h1+diCTYgAwczxc3q9d/FhKNkS81cEE2tYwqNUCiezXqTy
	NDuCWghBuDkOWvNgIuFcpLAWLrUSM8JNCLaAgoTjAUp46XaTze03wH6aSDA44do=
X-Gm-Gg: ASbGnctWPxE/hEqr1WqCAMtxhm/akAVPK2xStLdDg+8UHFFBVXPaooSdnuW3p6m4xMr
	EA+GrwM60Vezfgf1PKJRAqWMSX9oYFpeMWxTzsO3oTuA/LeWjfu5KIRf2qlsi8VRLqG6mIfypmv
	zIpSw7eYl71WIgpcz8pmtZvruSlyX5wmasDRb2HrXSRX0eO1dTGz3IQ1GIgfgORC9DMix/ihXWv
	GRSUp3KQoD9w2MI/O9CLWT4jR0vdhpgXNo1hTw7U3p33Z4OPqUDsVqlXzmznnWS1c/s3YV07bYA
	EYVtrPeMvS/nBnLzXy6cQeWTWnsTsq0vlSxq
X-Google-Smtp-Source: AGHT+IFL7lwZPaISIj1WLpf269+Pu5E33d6YUEVqcrc6nTOi1M6k0m9WUT3F6CqNiFcb7IdjyRkzYQ==
X-Received: by 2002:a05:600c:4e52:b0:434:9dfe:20e6 with SMTP id 5b1f17b1804b1-438dc3fc2b0mr182747655e9.23.1738589001477;
        Mon, 03 Feb 2025 05:23:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ece21sm12570858f8f.20.2025.02.03.05.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:23:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/4] arm64: dts: qcom: sm8650: rework CPU & GPU thermal
 zones
Date: Mon, 03 Feb 2025 14:23:16 +0100
Message-Id: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETDoGcC/43NTQ6CMBCG4auQrq3plN+68h7GxUAHaIKUtEg0h
 LtbWGFc4PL9MnlmZp6cIc8u0cwcTcYb24dIThGrWuwb4kaHZlLIVICI+WgHU3H/KLJU8LEl98C
 OV8Mz3HXEgUBBAagS0iwYg6PavDb/dg/dGj9a997eTbCu/8oTcMFrRKgFAFVaXTvTo7Nn6xq20
 pPccSCOOBm4NC9y1LnCsix/uHjHSXXExYHLJJaAWSJUob+4ZVk+v3wwy2kBAAA=
X-Change-ID: 20250103-topic-sm8650-thermal-cpu-idle-1e19181a94ed
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cQrv2SqpUl7InSRqNh2aggA1ZtzP147tm85RdAJwW4E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnoMNGt+5dpbHKnfldK7Gfxb8F3+lEtWQFff1cel8l
 qH82eROJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6DDRgAKCRB33NvayMhJ0eSEEA
 CHxvS4lrhCgZK28ztPFBV9weW0ZVwFjj3NEt8vSMx74bbpmLMoMjqDIBxpVIdQCdCJGdopbYmtuGWE
 VR63POYKSsXSfW26nzqQgoWzol6QHEmfUhBPT8WXmVPbosckJIPcjYPoODmKiZtoB9obrtjCvcbRkJ
 c3el6JsriIUAHfPAIiz2DHAP5j1/5nCdjAirJ17yairhuYcHHC34pSLowaqrGg1ICoqz7hEHTsfwSB
 YCnghG7FhylYlmVyrbwuGYVnPXB4CLYBguvyQtidZ4hnqaRSrB6qDBGiobzeTKkAsWVvSQXiFe9Ll4
 pEUq6IaRhDBNBXkk/9ksc8chmEM0ijj2cCwqlrraJOR8smbZSeEb66e1x880vOq47S5T1TTyMePfLT
 ir6C0B73yBfipaZ7hR3l25DScDHwDHVSqYk5VOFHIXmcT0swSRKSbhZlNC+1S9OeMPXjq4Ibuc14Mf
 g8kMwWRhwhuu8uN930kh6SnQ+Q0jdGRq/87oHLu+1Tn8UiRSTEyEHDt3XivzYOGS4q6MHfqtoVnZPO
 Zd7NOlL0Rf1qNXZ0uKSrbfuyZTX73tIWfdLRgJ4dEYQc9YBG1DTvEJmPVwnZqToB9yXiFmEr65FDXw
 DhvHfKuWySlQfgnyREe5DuCf9+jN0Ldi0J+5gSiyJ27BZf7YWl4OIxNWtPpA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On the SM8650 platform, the dynamic clock and voltage scaling (DCVS) for
the CPUs is handled by hardware & firmware using factory and
form-factor determined parameters in order to maximize frequency while
keeping the temperature way below the junction temperature where the SoC
would experience a thermal shutdown if not permanent damages.

On the other side, the High Level Ooperating System (HLOS), like Linux,
is able to adjust the CPU and GPU frequency using the internal SoC
temperature sensors (here tsens) and it's UP/LOW interrupts, but it
effectly does the same work twice for CPU in an less effective manner.

Let's take the CPU Hardware & Firmware action in account and design the
thermal zones trip points and cooling devices mapping to use the HLOS
as a safety warant in case the platform experiences a temperature surge
to helpfully avoid a thermal shutdown and handle the scenario gracefully.

On the CPU side, the LMh hardware does the DCVS control loop, so
only keep the critical trip point that would do a software system
reboot as an emergency action to avoid the thermal shutdown.

On the GPU side, the GPU can achieve much higher temperature,
update the trip point with the downstream implementation as a
reference.

Those 2 changes optimizes the thermal management design by avoiding
concurrent thermal management, calculations & avoidable interrupts
for CPU, and allows us to use reach higher OPPs for the GPUs and
squeeze more performances in both cases.

While we're at it, also harmonize the remaining thermal blocks
by using 110C as hot trip point, and 115 as critical trip point,
and remove the unneeded polling-delay-passive properties.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Also uniformize the other thermal blocks, using 110 as hot, 115 as critical
- Also remove the uneeded polling-delay-passive
- Link to v3: https://lore.kernel.org/r/20250129-topic-sm8650-thermal-cpu-idle-v3-0-62ab1a64098d@linaro.org

Changes in v3:
- The GMU doesn't handle temperature, remove it from all texts, just bump the temps
- Link to v2: https://lore.kernel.org/r/20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org

Changes in v2:
- Drop idle injection
- only keep critical trip points
- reword commmit msg and cover letter
- Link to v1: https://lore.kernel.org/r/20250103-topic-sm8650-thermal-cpu-idle-v1-0-faa1f011ecd9@linaro.org

---
Neil Armstrong (4):
      arm64: dts: qcom: sm8650: drop cpu thermal passive trip points
      arm64: dts: qcom: sm8650: setup gpu thermal with higher temperatures
      arm64: dts: qcom: sm8650: harmonize all unregulated thermal trip points
      arm64: dts: qcom: sm8650: drop remaining polling-delay-passive properties

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 430 ++++++++++-------------------------
 1 file changed, 117 insertions(+), 313 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250103-topic-sm8650-thermal-cpu-idle-1e19181a94ed

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

