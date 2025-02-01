Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE4B4A3E
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 02:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738377227; cv=none; b=FxjxFjYiSLLVTrg0XUeyf7sBqDjQQnpsSWYJGY8gf//Yr+PF/E8s9olvOQbcytFuuBHP1yBzDTfIhmSD99hk2EGg2AHdL1Y16eTHv1ZF/v8QoFmabLzPwcVEYVhbNKJNXjnUsV6s35BdX9OhWMrPUviAymAkK4PHUilu8OZkx9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738377227; c=relaxed/simple;
	bh=5NUV/Smhhra6PvizOc/P+HW4QM+0UoWI8pclAapHqJQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ZiEH2/wQbDlxrH7X8sNam0fu3MeU1oL1tlLs0CkBXy2MUtzVxzBfvmYH00B1reoPCPCKR+lC1EY+h2akRZj92DiT6gFqkyguNmb8uxdXCavKOT8lDfb+clPmQ9vo0/XKvnjoQ7vJdbtxnbJH4niXsZ2P2rp5wX43R3zp4dWZjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ihyUKAi5; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ihyUKAi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738377218; bh=5NUV/Smhhra6PvizOc/P+HW4QM+0UoWI8pclAapHqJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ihyUKAi5BnRh+FpXJBa6x7XKjZD6rNv5ML5FNrogpSSOpxCmluQHDL+PWqt9L0OXr
	 kPjOjmhrmJLLd/InO7MAbv+GxRhQTVX+9WnMn/03fx6FP3J8blYHYzHJIhXTm4Rmw4
	 v6tO8Ex2WisVif98yioLtPJ/73vRyqUgbLo4SVyA=
Received: from pek-lxu-l1.wrs.com ([2408:8435:9930:6b25:8cb3:3b5b:faa2:1ccb])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 6DA2024B; Sat, 01 Feb 2025 10:27:26 +0800
X-QQ-mid: xmsmtpt1738376846t6bkklchs
Message-ID: <tencent_8284967C36CA4BBA7491771966AC3D993609@qq.com>
X-QQ-XMAILINFO: Mg/0DM1Zd+nHsASQO/FUBv//PP9Q49On+jsXF7AhKKtmnbNIh9ep0MHq4WBRXI
	 CTgvyqzOfqnGdxuMHC9VKkQv77pzAqqLjWbJJI1dTzEz0H3xeG1FwkCgoCM6kgwec3XqzYRfdx1W
	 /PGYGUOkjM3Cmuzy2J51Bs9fyCXqcU9vBEoM3N4F4g6XWr57CjMhhaYohes42b0JMVPdCcAZ3Cmf
	 +9U/Qd/lOoAFmEx+f+eQfsuAjiFbU5+KTbbf+j7vggjw9oDy+kobhnlGr3oHs8buAgt2yxHM/Rzi
	 QPUIMiPF6Yxms4mbkW6r63hLWYmGB7fBO8pJGcgVXfYVETjJlu5sg5QC4lJpJAHy0JKN5zFRT1M8
	 sCrLSPo/3G/9gg5RKi6gzvtnjazDI1/h2S1iAoBFGNRCexCbMAh07hsPwZe8HhPKzQa7t+hlBzjG
	 e25XqzdOjb+BsFcv5VQDruaGprsLKrWHE+eC7BtiiGb3BCpMzy5/IH6jsj/O40H7YO8FHBfbktuj
	 Dg6Va38YWwWXhgVGWCOh+nYa3yj2mBETUjjU+PCod7Q2j3GeewwoM/Sa/HTdeZ8t7+Jue/KsEu7L
	 hFbUXjMonYPvpAZ4GJ/Ew7sLvxV/8XakC1gbvXx/+N3jj+xlCRpyluABtKmytqDJ5lnOw7trC36v
	 Zm1dsndiIkv0QWGv2L5dQNIZWx4w4KtC+gXE+1CW9RDIuRvdYhEDiNJBVS9KHcZLsBaycBL61OCL
	 q9G7iIHHUUB3iyz578rUtLgM1kFO5TXyfdiIumHj2lMdouHhod/fVG4YPJ3iOOtoFfrZkfTBG2sK
	 h5DD9+7ZqYI9YXd09JYmhrfstnTuZZfusdjgdGf38wR4WQxjcDMN8jWg2bn5pLui/8WY+ujAgMBB
	 Dk92vE0td5arrSgOTuNcwa1kCKXl7hsI4Pnn2QFHSUg+H3v63+S+X50FNGD/p/Dp9MbeR5B0/q0w
	 q69aFKuvgrBF0JE5xp6pxk+FJpxiWPACNZaz8bfEQ=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [fs?] WARNING: bad unlock balance in seq_read_iter
Date: Sat,  1 Feb 2025 10:27:26 +0800
X-OQ-MSGID: <20250201022725.782771-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <679d36da.050a0220.163cdc.0010.GAE@google.com>
References: <679d36da.050a0220.163cdc.0010.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: https://github.com/ea1davis/linux ftr/syz

