Received: from out162-62-63-194.mail.qq.com (out162-62-63-194.mail.qq.com [162.62.63.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3801DF246
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 03:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.63.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751598733; cv=none; b=fJyZ9BEhuQgfCrhia5x6dBlmDh0n+ZjyHiaskxL3k/gHEyyEgkpkPJOWmM+14OHeGdrU+kMVGWrbn6gGCAfJAI3NQq+WWmcA0raZQ4f3ZEiVmcYFcNGq5WU+kJeA6THcOrlV0BP9ECDsw9Zn9XPaAjd7qqNn9a2ezafpC0dsjmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751598733; c=relaxed/simple;
	bh=nYggTAMcLj6Uqc5ac+V9709CFd+IIQwLhlfVXY/u0K4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Mjp4fpsq++8yGEBm/KhHCfsqGRTfGwBhjsgSy5PaJgdb1RsDjOnNtlL1rBdvFoCMSk2E8FLnzdOxjNwZDLWgqUywa3iWUfhuSimMnSVVt1z3kqlVIJvMedEcF68AFZfCnWC3hKfrkQNEHtH04ta4khLkM3XXLWY3UTkfsXJZyR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dAS01igL; arc=none smtp.client-ip=162.62.63.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="dAS01igL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1751598725; bh=nYggTAMcLj6Uqc5ac+V9709CFd+IIQwLhlfVXY/u0K4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dAS01igLKiEgIY80eMambZkcvvF2n25fH43OeHIWr1+Vh20iBZ34eJ4MVCdUweJaO
	 B7QVs1vz1eqUjtMK0OTkyL14DllTpkRufb+T6GuXei18fioGDtrvK9HcDdk8nJEzbq
	 L+olhwP8bNVKsRolD6EJv4/E5SmlCb7AD5m/gfLQ=
Received: from VM-222-126-tencentos.localdomain ([14.22.11.163])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 301A4097; Fri, 04 Jul 2025 11:12:01 +0800
X-QQ-mid: xmsmtpt1751598721t1fxbom3j
Message-ID: <tencent_CC020A5F9A042ED46D9E3F5792E3FB53F306@qq.com>
X-QQ-XMAILINFO: NCmjBvJFq6XNTfcRopDfMWg5EYfIHLYheuFWAK/UmgouXBcs/zJRiRSLWo0K2L
	 RRA6nZSGdhBnzAudMiRIDPRvcfKXgsSz4RP4knAs9mq7HQTgOg2PoudFyJCiU9LcX6Y2e5p/WCOI
	 7U4QhqFi4eFQzbmcAqYWbOXeYWxGeMpO2hxDdaNrbyIFK5j2LR1BxMPHbuI4iN+qAVuekcqLXHWm
	 9GWdXlp4bYcEvw7wgzX3YKm8GE+HROtUgaFSGPT+XhnfLRo3irQ4FeKS+0ZmJE9hFvU+7QZ4pqRS
	 4Nareug/R2Itmo1sAXIw5HwRog5cwhDsWT4/zNcDY0YnULcuFps09ySbs446b9/gnpnfKHWlIpC5
	 rJIQ2Z2rab8t80AT5Yr4hQukaHpWTAtB55WFvrN5kBX06M1QWCPRFnel4wnZt2nidHNiiNic2YTy
	 FTG/jJjZbGLKc0LI9XwE/P2toGe30Jzwu4Ahf3Rf1ZuhOZpE0YtBtVqDwEf36eqCatznc1ICUW34
	 u0j0aw4McAsoZQ+Vsr7NmS1VYjKkIS9IpcO4abAaMi6V4cwMIGx97/ZWcjImS/ERbv7v0nyP6CrI
	 +68nP9E21HoHRMnbQ7IjPGlb0jkiqYoZUp4SMh5egYhcrSH5ugFJj6e/utFDCWRsDscfrT+vb0CG
	 o3XT5+likPfAKEPj0T5tbU5abzvyDyCIZdxbLUaSD//CQtgTgkfpxOEoLP2nSf6ll/NXjW265jms
	 ml4KYdNJOtWlSVUk2QyuZIYhA9oEIAHnBqM53lEhv7wR/5531Kop7NuRiGyjGEYwj9oye67S5dGO
	 RaVLvM7x0lDXwyO6kWnqrWb5ngOMk2gBoSMn+AEC746ulNvAQ+6B1H+D6HfqRpnYYrQ6oQyw/esE
	 WQV51ZXFz5UE3SV9YHTAwUyAW4js5DJsY8La00byLqfFDnlMa1l3mrxpvg7OXfcCgeSDiLKhDJCU
	 bRXWR5taDF8OFGLzmY/WW0hfm7mwmlzBEboKeO7ydIuMvJAaOVjzP2XIT1TtrBTfkQLtTBlbtDe4
	 zk5B3whbo6RcDzQr2YebBytUkldli3sZUQsLXj7jN4790CYOXtNXYlqQsjQIaX5nsYLJoOSQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: jackysliu <1972843537@qq.com>
To: harry.wentland@amd.com
Cc: 1972843537@qq.com,
	Austin.Zheng@amd.com,
	Dillon.Varone@amd.com,
	Security@tencent.com,
	Sung.Lee@amd.com,
	Wayne.Lin@amd.com,
	airlied@gmail.com,
	alexander.deucher@amd.com,
	alvin.lee2@amd.com,
	amd-gfx@lists.freedesktop.org,
	aurabindo.pillai@amd.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	joshua.aberback@amd.com,
	linux-kernel@vger.kernel.org,
	linux@treblig.org,
	mario.limonciello@amd.com,
	ryanseto@amd.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com
Subject: RE:[PATCH] drm/amd/display:fix a Null pointer dereference vulnerability
Date: Fri,  4 Jul 2025 11:11:56 +0800
X-OQ-MSGID: <20250704031156.3113667-1-1972843537@qq.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <220f9fb4-45ad-4997-9572-564242737dd4@amd.com>
References: <220f9fb4-45ad-4997-9572-564242737dd4@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2025-07-03 11:15, Harry Wentland wrote
>Thanks for your patch.
>
>Please run and fix this checkpatch.pl warning:
>
>WARNING: From:/Signed-off-by: email address mismatch: 'From: jackysliu <1972843537@qq.com>' != 'Signed-off-by: jackysliu <Security@tencent.com>'

>I would prefer to simply wrap the dc->ctx->logger and dc->ctx bits
>with if (!dc->ctx) and avoid the goto.
Thank you Harry, for the patient review. I'll submit a revised patch later.

