Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E254CB5B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745771758; cv=none; b=S9+uj9MFdPS3ixNj/4wEQzKJBr91ySAJP+t8lYH+3NLPW88ANVNFFSFodcgcw558hpSKbdkgVXvXV+WjF3fdiQBn0LKDu3hjFMWi15jMRancNE+8ppTzGXpdMx3v3vz532iQjj9bctiMjx+ublrRNTWoqp+nblTHxEwZfypVwm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745771758; c=relaxed/simple;
	bh=xKZTa8Jy7yRLXDMe0tk99VhR+7Dd1SQty7lWFn9NEtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YEKa2uSzp6vvP7iawlPCYxTIQV7xFsODUD082MarZ0QFnNy944Wmuq9Q3czaIKcKQ10bnRaeW85n45BCqVxv0qDPCo4n61orjhSQkC9i7bxeapY0kR8tnCwmUkdXFikvFu1n0JsMQ5Gbx3DVyQNzwSpw0iDveYd2PeLvqdTS0wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jRWTLAjw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRWTLAjw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22438c356c8so43502965ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745771756; x=1746376556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik+PKrYUz12n/bOV4S3ZmMhIipJ7tfQZAjp79yKcBVw=;
        b=jRWTLAjwR7+yIIFdXZCWKcDJm5uERUTR+tQKR3BOM5YFKwsnaVaxUbUuTvoCIasZZq
         ViPJhCzsK4HjeyuEDI5pZt2OZElIy1R60K36mlshOkjppMrJvkW+HxP7znMj8mGdcuCO
         +Qooo3T24r87Tv8rjBAznlAwm7G58L6gLSPOyug4O6Gv1fZDD7IN41qbNoEDnZKLI5S9
         CSsEqbfbQs/Nw+wCHrXqBoXc/pT4WxHNXOkGXrip8kwO5LL3ta3kXnoUTX7g9djdiGHL
         9Ts2vGzAgtLO4BV9ut7CmMsT0plGg7MpFRtfCPWnwtkKUwxZvHp8QbWSL9oDYfBD8FT+
         8AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745771756; x=1746376556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ik+PKrYUz12n/bOV4S3ZmMhIipJ7tfQZAjp79yKcBVw=;
        b=MH2mIGyhgzkVzg7gl8iCrUO3DPbWRyMZvuMybDbTN7luqCNRaKlGbiILS0uwoJlIKW
         AoIxaCH/PgvMHNfyyg6A94BO59p7OnmnMDHip4vaLZbh+oIox4Tp8sueNbraAGevmBRA
         XfRATkPeotr85+zwxyX4VeLdKHj/NIXkgcmgJnbUyZ/VPnp5RyPEdoblW8/Ndg45Tt/a
         3ym2k0+JY/uxnxHD738oLAzgFyvMxZY387FPXJYx2BAo/JNn4yuO+Vej67xI6WZVbJ7B
         Kw9VsZ6XHk1egFSxfmTG9EcWjlqv4BJaQnyL4z+C6MniUHH2shlF6GCj4P76hgX9TWIq
         ywJA==
X-Forwarded-Encrypted: i=1; AJvYcCUhmux/CoGIOLRE31kFwqAXicNRxTwQ8AskIiWC74uXtDJIT4TppYoPvD5Qq4U0EMHMYqQFrAsGMCWTCho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCVocWX1OHRXmwVB88T2n2Zq3u5tjXdNOSFRRMWdDn0gJLIjzY
	XUkIJngtpdPVDpk386zARmoYqowprg7lsuXnXMZy0codI6SVV+mHoecK/8g88Q==
X-Gm-Gg: ASbGncvRSxncj/LAjAsXUJ3JY7Q7gjKsvhF+ZzKKlHEPrhRfzmvvBdFHXuDrS/5MLdf
	eNr1WYvJwgeuPfyz1WkHW3UOttDHyOd2lpq8SRNZcJi5/NEDkMnJrTAJKCfPJtacnv1DATyVch9
	LUUPuZjaeu6NkcXMsjuQTUdhEekHPhBNUMxyMf0JZw4jm06usGn7uEt0aO/pbG3ZXW/55CzNhcN
	TDxZlU+PJz+pZugRDn230AU2qDhgBjAVFhQ8sVpPFBLGBO6/KOkUp3O38b48c+uZ3YqEtyBWgYi
	m5OcBXGTI9Q3QTI5dboFrrckrI2j6uepBuM12Q8q0xThPxJbBB4/
X-Google-Smtp-Source: AGHT+IEAjFA93KKywEnB4RlSwgSRb34pemnKDnzT+Il8EQ2sIWnFIevqhAIcyqRFAwl1jP0V/maVcQ==
X-Received: by 2002:a17:902:ef0b:b0:224:1005:7280 with SMTP id d9443c01a7336-22dbf62c74dmr150793215ad.38.1745771756017;
        Sun, 27 Apr 2025 09:35:56 -0700 (PDT)
Received: from thinkpad.. ([120.60.52.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7851e0asm5329424a91.48.2025.04.27.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 09:35:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Zhiqiang.Hou@nxp.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	Chen Ni <nichen@iscas.ac.cn>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: ls-gen4: Use to_delayed_work()
Date: Sun, 27 Apr 2025 22:05:46 +0530
Message-ID: <174577174111.84046.1840850940994966437.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414074241.3954081-1-nichen@iscas.ac.cn>
References: <20250414074241.3954081-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Apr 2025 15:42:41 +0800, Chen Ni wrote:
> Use to_delayed_work() instead of open-coding it.
> 
> 

Applied, thanks!

[1/1] PCI: ls-gen4: Use to_delayed_work()
      commit: 5e2664f9e108f66046869ed4990043421919465f

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
