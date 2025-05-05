Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1072F2701BD
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746473158; cv=none; b=gw3b057CmetUdcvGfQpMWx058qaOaMaALoI9i+1Kh+rBBGl9b4CPKVQv57V2cVWNe7IUt2JIj9SBHU73CmulrpJhzBhbUzRNK3OWsMUSwpaLmfbuayUMBQPG0vvA74uxvddu2xOW4JQ3AOenwfEdmw3MZrIYrwaO96lbqmlBlPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746473158; c=relaxed/simple;
	bh=f7DXB5nB+c4iG/ABebkx+rjxNErnEDVU+G6zBUcAfvk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tF38Be39mWbQm++Ar7/nRDj8wMJb65pcKco+99BNRORRmqbwNn6zX7Cv7ld1AqvFvFj6MuMMw4ynkZkhHITS2h06DUJuVRMxaXnY/RwFgjJnkd1JGTpTI+5KcyJMqSi2Cu4XOzkcWnc7OkPAQPInfIwGQhUYCSyr00hoW2dtZts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xRkLqszr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xRkLqszr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so5749195e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746473155; x=1747077955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UM06Ci3j9hLrq67N6k5B3BPLGpbnWIgUSj1Od+I2HbE=;
        b=xRkLqszrne1cl87OM8aS90e8YKMgbhDMnr64wQoHhsg2I1odCOwJrZAeB88M75QcBp
         MwDPoLAJoHwRocfuzO9X07MFgf/tN2ezS40glD449LhXWtIKEzYTa1Uet8GKZLjwmco7
         iHDN2JJowVgYHmVobnMr69m5QgG4ATfEmOtWGCwAKTpq9w0dodR+FN50FJELzKcKQoKr
         r4peDAsytuN4bKAfJEFD5Zb5vWmgpH/NAAcy5RVJulyXsS8nm5a0LTAzV81mojztLNIA
         sHgU1CVw/8v3yBk5f2eCKGzVi4YAuIGnOrNOuYC8seLM1DIh9se1/NDwzaXWfHuc8bNg
         ckSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746473155; x=1747077955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM06Ci3j9hLrq67N6k5B3BPLGpbnWIgUSj1Od+I2HbE=;
        b=Nj2FZLfWmFkJPS5ND+kxlBjfFQpAos7tZcapO5Rov0vRhNcdgMQklVL418hqF+hmOh
         nhNF6adANHzUEVGjYvbNhx0hAMh9OfouyBN4p4I9pDiCcUFESLMIEcdpHMq85aXzb0+g
         mBKsnJyavryJBKw7Dh4so2ge0+SSFZXdTXf7CTmMG2cfd+jCpZbPDxn4ARgnpnPayruR
         p0HndAW+18ubsw6+98YxJTi3ctwphDY4kbhPcnwPk5hyvVsTS4AtQ9N+T3No0r2pcqSO
         9/TFSk8gmblZTz98ChlnQa3DwolLttfiVf2zrPDsjgIP5LVNM3lynVrdmhCtTvDAguzU
         0cDg==
X-Forwarded-Encrypted: i=1; AJvYcCVd2S2h3iPBUYkWob55A0noM1naBV+/laSjpJYBIi4+A3dUA/YqgPT1aslI8zEAP+nmGh91PZTBpxS9d4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz9eRmszAowwKdqegj3zIrv25MR4QlJbHse3ZbePLo5SS6wxUq
	XGqluVprLlRL5odeEf6s+kp3fHQu8OWuql+Y17ZaxcYN0DP/LLiO/+06c8qLbdU=
X-Gm-Gg: ASbGncvlAr4daqbQrMpDh8cfmkqt45NoL1R9/MHYskBku4C6yDbW3+oQ0Bez/nnW4rm
	440qwbG4FTV4Sa0V4syXl8CYknfwEovAZ/1fh43eNrTrXdcwcAHjru8TYknqz1E4H1wpCSmC8tr
	MFUCwN0LgIy8QIAaqxxjFFaY9OOKQmwsYv6/9XfkqgpSI9LIhy+WsiyoZHYpb79MoMgPKVN+6zm
	+U70ZKqQtn5zY8p+tG6ojG5leyaZ8T2OZix/CKFOR4wXlDjEANNZQ1rKg0q4iy4GbnIL96hJ0el
	FDKpXmL0Y6z8eRs84dw2VjoAymrJlkfOP2tVDCLPCBMTjnPU8g==
X-Google-Smtp-Source: AGHT+IFi3XHJBEIqrhHB5yLjhwHOJHh6sU1xCaAtDwSKMk8A4YTOWmdKbrqZscXw+g0AJqi2Zu6Ezg==
X-Received: by 2002:a05:600c:1da8:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-441bbe25a83mr49247965e9.0.1746473154960;
        Mon, 05 May 2025 12:25:54 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc441sm145342045e9.3.2025.05.05.12.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:25:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: vt8500: Include vt8500 soc driver in maintainers entry
Date: Mon,  5 May 2025 21:25:49 +0200
Message-ID: <174647309276.308425.5040927694652626362.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250504173125.104419-2-krzysztof.kozlowski@linaro.org>
References: <20250504173125.104419-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=405; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=5RtXSzXeFSuZgw0PrqV/DJqniPH8S/Ajpv/Y1KD+D10=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoGRC8XG/IpZYlUJg4+Sqt6sKWn1tHi6D2j4aSz
 SEHFzip5zGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBkQvAAKCRDBN2bmhouD
 145yD/0eSJj8yuAdPL/vbUt8cGkflS7gvd8gv1UTNRqdiCllFymXkq9cSYvzM1pAFdERqMb5Qh1
 V8rO8bCqu1kYbOKZOFR14UkdftXUCjs+7FblzN9eDWWa71coPWQ7t7VbtaKpqfopGeLtdfFAE/E
 x3zsgakn+RAKfFffbcaxZe+Ie78vObWPt17c+QDJPPppKWRbwye7LTwqJUTs5Gs54pAdiUWvHiC
 2gevoQpyHV0dBJW/AdKCtOKyHhqoTSvJFy82Jo+lR1DB9p2RKSFRDlBwYfz8PyUXr9lOIolsMlV
 3MXN1+A16s9ecCeBnK7NjPBJfmhgdaKgpTkbCZonmL0x0LE1l2L0ol4m8IcNlbn1YbzF2KIoHXD
 KiovzKmiS3PGWy9FReXdJelLIARrXNxmIwayyoSrZ+LRWP1bDSpfozTVNgL/JD3d6lKQBalD51r
 HLwDJzcN7BnkJ1uR9WptRghY3MWwixsU6907UiCk2JXSRWBJ+1HKsrXeItQfOwp7NqVWSnc+VkW
 vkvlfQA0l0pdgR72QJM8LMj8mSuRsDzNxd/NvzauYtHYfBglKne82koSzwWyZ79KzzIfr29CDxH
 Ig1BU1mh10RYHcPho7wPpmJJ67X++ePMmGlqTOWnfPYdZOR+JAQCmBaTJZK9ddpMSM1K/da6zeU L+CZqLmqBdnW5zw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Sun, 04 May 2025 19:31:26 +0200, Krzysztof Kozlowski wrote:
> Include the SoC hwinfo/soc information driver in VT8500 maintainers
> entry.
> 
> 

Applied, thanks!

[1/1] ARM: vt8500: Include vt8500 soc driver in maintainers entry
      https://git.kernel.org/krzk/linux-dt/c/47cbd5d8693d4245997a1d6f96b158c6f6d68cf7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
