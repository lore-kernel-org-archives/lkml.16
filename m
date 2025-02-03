Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D7C1C54AA
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619243; cv=none; b=ZgL1jCDwl+hVbD2jLHldT4AVCCXAxdAnZzQSK3Kp2shgJOg/jzl6OSQkFvy5acUFHmgo+prPhjHX5KYe3W22iolXgKoD4d+DibW5dvKCzxxAJuI4Y9y0+ifJY71xoSScWJq6yfnhSSMCsG46Sse5P0Jni+AgWInCJy4RkTxiOCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619243; c=relaxed/simple;
	bh=V1xB885sZjCtclbLnxrZTLnGFCBhAT/eEX9yCUcdNyk=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=O9XiSDbTIn5Y6NiTZY40rAnyWIKOVVSrQe1iI3bg/Tw6Z/Ppf/pi4nxGAVFE3BXeOOdKYfohr5AnDwXo0Jg//pWx6mTySYki8UptV4Fh2CMxymSfwsWag8lBDyk5RArqpHqTn/FS+3dTISHWI/DDyTS2J4AqEtKTcCLJpn+JHIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=UHTH/U2M; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="UHTH/U2M"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6f7d7e128so552494585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738619240; x=1739224040; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtzB3ZMfNbhHsmRBKV1gvJMhfUuI372zFo3ZA2049KA=;
        b=UHTH/U2MFRobMmt0QcX3O5dZkQmYfBrrOeREipTWsoVya3FXW3IylWYihE0PjTw/K1
         JPlb4Bn5CWMBvXDeeGCgfIfsv4LIoqvRxV/3TVOBZU9zyYzTKuAQgjStkPulBrVd5k3Z
         0Ewh7yxuaErn0znec0og/EU7FVmjFji2xlcJvTp7+rY0ZrzOAReElidK3STY6nAHmM/l
         lC7Uomri5Go1Hzwnu4KjuEk8I2XcyscviWwALWKt+PPOy+S3cvTEprsjb+QUAWRr7AUt
         zlE3NI3b6BgJpV7P7LD3hJMDO5u+yM/fKVleNsnmAcbDjPPhFNHydGwHr/P54oNZ5LGz
         EbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619240; x=1739224040;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LtzB3ZMfNbhHsmRBKV1gvJMhfUuI372zFo3ZA2049KA=;
        b=qkttQXh1n3zK5/DbCSsRJDoIinU7j9vN8GIYLiyOwfPx1P/+kx1FYTqkJ8Pv7pDPMI
         JBtcprm+tuy++60lSumnVc0OVC4sEjfBefSah4datQTKLnlEF2ZEYYD0x0lPY4nTbPM/
         wsEins5KC7IrcASB1o1c8uLuOeBLVXsoSA84WWkCZghfYaFjWZeEJiuhyrLXSH21V1Vo
         CXafDbxfwC+J5+2JXLP+573yEpgX5QxPl15kvz6QSJDN702TohkPxrjwb2B5sdrTVQLz
         zvlr/WQgBFY1czBqrr1yX6EVFqpF9KXACTGlPy26ge2NpBJRoM1YRsZAcc/weXOjX3Ng
         ew5w==
X-Forwarded-Encrypted: i=1; AJvYcCUIMyGVAJ2uXVvACqKSPFMY6Hs7YjEX4svKyYCpuz9/YB380uj4WNcX9IVRfhyQhzs1qy/zlOdfGqJ2G34=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn23inNepGVGYcRB9Bxz9KMPZJpoE1i70xI0lRlovLWyO27hpp
	jLwVeNikhJ8RjRuWZFPFSgPJ0b9//QhyBHuYyU78q5ZHZgHzBDkIPfHrolzoQQ==
X-Gm-Gg: ASbGncu7Cy2zUu0EkeXKilr0OsOyJTdH3QhKsGvBtY0t5AQKdEiKBm8J3Zgt/9e73zY
	2WWlCkauS+Qu3grw8R+s0yx77aK1EdGFqnvVeP3nZIodHzq8ifimWx+khXvxK/I8WIJileKwAc2
	Mj+VW3VxlAxXu8lX2nNX2L7bLQqwRcZvRIdA/HvY8YyCO2jke1WG82676aRKknVKdLQezEOLxBv
	QpiOpkNzDGQ17LXJlUm30qzbxcx0qMcFFcB/rl5+YJ1kWH4V4T3QHdanZzML2m1nsfSeEcjjaVs
	2XNdevvXPQ==
X-Google-Smtp-Source: AGHT+IGnV11UhVQCtrYqEkA3NCK6iT+3NmchgNIU0leeA3Jf2Jw0ndUl9bbJasXoUl6ScIaTo80doA==
X-Received: by 2002:a05:620a:2722:b0:7bf:f3cf:7e4 with SMTP id af79cd13be357-7c02eccef16mr160375485a.21.1738619240254;
        Mon, 03 Feb 2025 13:47:20 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c00a8d96ecsm569974185a.62.2025.02.03.13.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 13:47:19 -0800 (PST)
Date: Mon, 03 Feb 2025 16:47:19 -0500
Message-ID: <02b224df782568080a6d9519edd8810a@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250203_1645/pstg-lib:20250203_1255/pstg-pwork:20250203_1645
From: Paul Moore <paul@paul-moore.com>
To: Tanya Agarwal <tanyaagarwal25699@gmail.com>, zohar@linux.ibm.com, stephen.smalley.work@gmail.com, omosnace@redhat.com
Cc: selinux@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, anupnewsmail@gmail.com, Tanya Agarwal <tanyaagarwal25699@gmail.com>
Subject: Re: [PATCH] selinux: fix spelling error
References: <20250123195039.2793-1-tanyaagarwal25699@gmail.com>
In-Reply-To: <20250123195039.2793-1-tanyaagarwal25699@gmail.com>

On Jan 23, 2025 Tanya Agarwal <tanyaagarwal25699@gmail.com> wrote:
> 
> Fix spelling error in selinux module comments that were identified
> using the codespell tool.
> No functional changes - documentation only.
> 
> Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
> Original discussion:
> https://lore.kernel.org/all/20250112072925.1774-1-tanyaagarwal25699@gmail.com
> 
> This patch set is split into individual patches for each LSM
> to facilitate easier review by respective maintainers. 
> 
>  security/selinux/avc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged into selinux/dev, thanks.

--
paul-moore.com
