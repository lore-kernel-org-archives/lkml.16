Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A141A9B4F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743056861; cv=none; b=EnIqCU+y4wYc5C/Mg+hRciMYco5Kit0vpDqjLzGVVk+Af3LwPc8qtd2a8Q+BTNY80Raxm5QPU2el7IuQOtAas4AqrjbY2ybNz6vOzocmNKFjRKU9IawhMt2tQrIUmshRSFIGZjiYH11b/80FRoORTyo+jlLCOUgnbcIBAiOQD+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743056861; c=relaxed/simple;
	bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2+5kSGg3IumoQ36mXX3wCaQa3YJKZ+pv02Bd9tA9Xq6+09LXpoS1YX0NwkqOH3Hhy7AR+p/b8d0O5wDp9H2MH0aayh25jXqw9KkeJaMsd//lwZZe9xtnoHxXglhHpYxnW8WvpHrQgveuWTC6M+bDgw3YFGTYcvNl3gcgkyOHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Slx1x+X7; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Slx1x+X7"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3011737dda0so726416a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743056859; x=1743661659; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
        b=Slx1x+X77vv+lBm/QSo/JzDCg5zL3cE+6cCBpC5Bc8vE4vLaS8UZxH/mGc5tkh7PHD
         u8OaFfYX9eRqGiffN9GCxXgfXv3AUdb6YhuceWvYWMWAfUt6nKLoOAiAHzF5ZlxT845B
         qwnwdrqf8oL+k+bliBKFqj3oxl2rynksEqTdl6Px2APq5Et5xjnLFHHFO4XU1QnJRXQ2
         Y5GJie3APj8wN8RVlAeO4TRALaqhGjrUS1LA8UknXJ9RnOlTexp+YPIuOHpXEiqCyJlV
         7yubMZZX1d24EaVRZlQ+ZKl+7EVD3maOJobMB+YDq7kRunvauKf8rfQxALyKVJul8zsf
         z2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743056859; x=1743661659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
        b=T2v7M+m96qcnxhQiTMoyqQJvIyxehFwKE53nQz9ShADJYwpV4zIVTWPdVj4TyaxkUW
         EsTvhH0A14cKCVJE353whnsHROWUQkTPwxE9iOeYykmJYzrXGiRmnpUnnE1BWKGx6HNz
         TYpVwG1dhvK7cI5jQS14J5QaxkLThFv4YnWH1pv7iOF5oKVtOIcbnA0xL0WPC2frTErv
         Q7fvzZ5sdP9e7SL9qH6owL4GCa9CBDz4oXYXCSxF5p0ajYGQ9Wpvbaudyy6LPc5L5ttA
         3KstBXrgcwjnqnw4PeA4+QdhHfBKcm3xGYyCLyKIPyydpl5ggBEBsYQLuqqelgyCMBHQ
         W5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCX/puN+OceMXsjXdfCuUZZ4Wt9bptXyyZ55YXyAmE6D7OXPuV2NSReHrXwJaxYdIoPMCUb58n9/p6gKVD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbFm5fIfUnHcgSAz2bdUidJrNEV4p0V8TwFq0GqVnPIDOyiDc3
	27LP7KfMj3v999BzB6HAvf78H7zfmYnFCWdEGA9NwrLOQdohVLbTQ0wfvv/rB9T8Ixqju7zEbOk
	NbsyuSq+HBg5X/NcUFSZu+0mCleT1bipcAIKg
X-Gm-Gg: ASbGncuiFgH/J9yf9nC5r5Q+2FCr2TAqt+vbpyI7Remtf7GyMsgkBoSw/eIjXbJDSoe
	wVT9tl1RvyXmJ4hdJOTQaDMid6dXYDeXnCkOJ2AT2ZcwIHANobc+gHUw43cdCkWVmlvLi9kRZal
	k6ZIXB9UEXBO3STk4Qyu1Ag+M63AqSZjpElrCcvWzogrdYxx0XgwWPs17Y
X-Google-Smtp-Source: AGHT+IFt7Uet3UwCNOAH8meYB2W9ViJLDi7wcmCNPw9mSbfJ0sSbyamjROCSnSFkmO0FUw183zFiWc7Rnl9Qc4okr5s=
X-Received: by 2002:a17:90b:354e:b0:304:ec28:4437 with SMTP id
 98e67ed59e1d1-304ec284935mr218399a91.22.1743056858259; Wed, 26 Mar 2025
 23:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-2-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-2-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Thu, 27 Mar 2025 14:27:00 +0800
X-Gm-Features: AQ5f1JoUEAB76GccOuQU5OR51PoZ29U3C8QHFwNl_oTL2dvwjiuuxHuLDi3FutQ
Message-ID: <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

We have implemented and verified the USB audio offloading feature with
the xhci sideband driver on our Google Pixel products. We would
appreciate it if this solution can be accepted. Thank you all for the
work!
