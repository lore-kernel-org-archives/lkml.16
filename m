Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388522F173;
	Thu, 29 May 2025 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748538042; cv=none; b=bpBYIHkyIOj45Gv+WmFCzSVZgYbtMQaNX8PvRO6WkDLXRprcYRwNsL3tLh7rbJo9qXOiF/wvT1ry3Z0rf0kR8KHAGBrSTpcbQWfWvOJpivR2zwvv1FvysOREGHmcxrLS+3jWStrp5hk1hMSMA2Ep/xzaiOTBX9JM8Vu4Ls10umM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748538042; c=relaxed/simple;
	bh=wz8sylcYsf0e/g2Bj83ndjpBmgj030GnVYpd0gvwJ3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RmzhhVeFrT+XO5h5M70hUml4EReDC0YDYHHAT6Gt7rrGuS7vDKyYU6VRTUvArxahr4mpsHHwqEmv9s7/BjwnmuPckwymOfrxHLjaA7p3B6RZ3UfNEQbsh8Y59V7uRmcoJh+Acu/rsxuZS3hPYrSiUli4tc0CtykOQoFIdSrRT/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOxMKoNL; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOxMKoNL"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso3505205ab.3;
        Thu, 29 May 2025 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748538039; x=1749142839; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wz8sylcYsf0e/g2Bj83ndjpBmgj030GnVYpd0gvwJ3k=;
        b=MOxMKoNLt5NG/iyoavQvvJ27CejfZdyBGieZ5YFcKut9AeFIsApWFPykjOv0iUU4+5
         py6QZDYmsl+NvnwE8H9UkWRtUfrYMdQNYjFyUcVplD8jhLPAYdnI8pBNfr447wU0gRrz
         oOf7vQG4pZU5WJ9TWcnEzBvrh7k5fW5S6gV+fvynXR9DRmMlCwMXgpDmPMQvCIWFrSa9
         pn85UmtWSOGTiXkyP6eRnS+uCWR1pCm4BauU2Bt2RwVApzmxX9fT2dv5OT7Wivs9A9sU
         dsMosVXJ+KbFhaLiUQlU6+GJyZY+/gWjCulQR8Bqw7YXGSLCEjbWYWypyNhosiZ/S2Ya
         ZMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748538039; x=1749142839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wz8sylcYsf0e/g2Bj83ndjpBmgj030GnVYpd0gvwJ3k=;
        b=sfclw1TOkqr7jDRrm5Hq3DrgAVO+7ZJcHOFkqxTC5QRaa+4OSr3qNkpYUuBsGQnfri
         i0T7y2Ba9GH8Szmzj55N127g9OuAlnyZY1qxqKbzlkhkaJg+8vmbfcNSv1BBfXXOGoTw
         tgxPxKujaSov+MxBd5XUKEk76Mrs09o7924qxiPje4MSt1YBbxPm06Q1icvSIWVKOVuu
         FzHcLPH55gbAbdl9sB4fzHvdnExgGZwdYs6Pu2WUN05SrTNWV8BZqT9XZRLf6tdBilHf
         Y5q2+REySYl5MJaFYVFwxQGd/Hcm8qbKOZi1wUisMaX4C3TjsYzPdB3HhrksY2QDaiGA
         kHGw==
X-Forwarded-Encrypted: i=1; AJvYcCULldaHkXcJ+XfYf5wlYwoyYSaeTRBchtTOwyMQfQFlGv0HMmBGXVa6mHp+VvS5Qk9m9s70sZAkPXsuMTxm@vger.kernel.org, AJvYcCXB+5fd66khx8uc8jrNH+4ABkKFR30yGxJBEKO1FLIBoF1QKiZf/BQty2KNAIemCvkQ2bF1KKqqDX9L@vger.kernel.org
X-Gm-Message-State: AOJu0YwTruNl9k3jvUmU9M+6E55Uh1bNRD+Cv+aGe/M4CESmGwyGiifB
	PHvwhYu41ccqtFWdYTTkwN6oY7pG1F7VLmof5AUqZS6gfC05JMGShl7b7Kdychdq+uzgmHXhuhl
	X/kaNPzPUT04UWB2mIU5Xv4Z+LhoFk3Y=
X-Gm-Gg: ASbGncvAjCroneoD3x7WuWbupFT2631JbRCmvWOQxgO+3U3i6KzLgSRv5f5HWDkro6W
	N8os0PNz7Nsf7/rT6L/KBTcmCz9M4Wu5/hIRKpDOGO+M3elZFbjv4VKvk77gzQTK7FNFgryJSTu
	V4KC0yG3ehJIeNITOXk5hYuyF67Oh7HH8=
X-Google-Smtp-Source: AGHT+IEyjJb190MgdwjRZw5y/MpOJIX0f6ygYZysAtuVDDlApMx5G40bgqJeidmJuOkA8YG0DhqaZtLvRLAokkzGbU8=
X-Received: by 2002:a92:c269:0:b0:3dc:76ad:7990 with SMTP id
 e9e14a558f8ab-3dd99c3e914mr7298515ab.15.1748538038104; Thu, 29 May 2025
 10:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <174735136138.1544989.11909422896170025756.robh@kernel.org>
 <20250528221823.2974653-1-joseph.kogut@gmail.com> <20250528221823.2974653-2-joseph.kogut@gmail.com>
 <20250529-impressive-real-monkey-a7818b@kuoka>
In-Reply-To: <20250529-impressive-real-monkey-a7818b@kuoka>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 29 May 2025 10:00:02 -0700
X-Gm-Features: AX0GCFvFs5pZmBZbHDiXb0YURJxT4pYR9-M5FQPF83VV1lZt1KUVAfxqyW1PamM
Message-ID: <CAMWSM7i+eyV4t3xzSXdDyGrBr101V9rG1xMgsTbpjyqpu+hjYw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: rockchip: Add Radxa CM5 IO board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Steve deRosier <derosier@cal-sierra.com>
Content-Type: text/plain; charset="UTF-8"

I've reviewed the man page for git-send-email. If I'm understanding
correctly, I should only thread the *cover letter* of the patch series
when submitting a new version. That didn't work for me here because I
didn't initially include a cover letter, then tried to thread the
first patch in the series. I see now how that would be disruptive.

Thanks for the review, and the help with threading, Krzysztof. Parts
of the mailing list etiquette are still new to me.

Best,
Joseph
