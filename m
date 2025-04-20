Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0685482899
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745140758; cv=none; b=LR21Zeor4RETkT8j+nuSGkSwuO/p648tQVU/UO+ML1e4UVRmm9SxABqiaoKjh3acAsB+0/WZtserJz1DmcW4p5Qy6VpVUqbSUOr7K1VNpqAveb9A1hRZ1f7plQi7KiFKAM6zguilG7+lQbkzrB3YKwfaHH6jPtZn77hnY7rn8TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745140758; c=relaxed/simple;
	bh=jSUVI6f5tRAnwD2oMB+vqMvGqIO1TcYj3UtT2V+GETA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=e1GF92Y8s5sFta6kOwi++41QdZ6H51fGCFprVqH/SpjaLaF8gyipOCM18QrdjDeiGfSZO3NbRbcCfvgKa87fhZhwXdNtMlkMORhQbALPaF16cxvjstb7OfgmshqQ6UuioZFFRE8N91XJ8spasbvrHhZ7NydVvaALRHC0ztpINDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=LeOZLXV8; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="LeOZLXV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745140750; bh=jSUVI6f5tRAnwD2oMB+vqMvGqIO1TcYj3UtT2V+GETA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LeOZLXV8LX0QPOJEhhpjbPzo+BQ4IsbDtKgQUk1+dTRrLdhWjcrJNGhsikm+/8ZAu
	 v6woVPfT/MWr+9LaG82g3YlHAV9jpKqWUimB+tZfw/CWOeTNc6aQTJQqgTP4OcQp5d
	 NkBiJnm57xtRVtVajNs/Ux56TaoeLijOdMvot6l4=
Received: from pek-lxu-l1.wrs.com ([114.244.56.254])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 17222ECB; Sun, 20 Apr 2025 17:05:50 +0800
X-QQ-mid: xmsmtpt1745139950t29k8cifw
Message-ID: <tencent_6C9F99274FCE8DB625B10D81124BDD86DD07@qq.com>
X-QQ-XMAILINFO: NvH2zBBgt3uTFtyx5PXP19paAjbA0OY8OdaTo/A2R3Jgs+ePtDk7cv57yIyadF
	 4fBx/Eu+MYCGO+U8iq4AVzdF6waRvNDCooKAG1iCgHWiSLVLEPClzz+oZwpuTQD6Ff3TG6dJhpV+
	 jBEIaEM2bHI2IkOIV8uV6wITixS6VImpJldtdqLIQWbyTUSfsa7plZt0dsTvG0fucMruICNJ35hP
	 T5kuNyAlrznICKzFopTWdGWT3O3T+92apuoCo4bMlApLvJz6PQD6sMfGS+RA9RH7I+aLlNvT8MHK
	 PWCpYbCwLlGlnaUWq+1rz18+LTEz1Xhjw2/Qe771NQsYXmrzHK6ogWRn0LxVriEzFNK9uCk+NVEy
	 XJzJzomu1NpZWqLzJuUgKoTVkb8MYp2EX/dJx6ueGkrj5sY2xS/vqJcKENoHfE6k4PPHzE5hxQaG
	 95GDgtjL5S5K5Z2OZ9O0ORiydOQ2fawowtQFiBWHm/YwMKdj71H2Js+UgMsErBtZn4n25X3JD2YE
	 hGc1ZdjJ7YtwL8Bz7/aNgMqBUQFDUYi/LB+aS77D5nRIU3yDrSGTdQoujUzipBU5fQlzMntP1mLV
	 x2bzCa4JfcdQCe8bRLLr7SmK7WC5OFG8pSuDwOrun9wzxRgpBA9OGAhL5SKykRQSVc3D9Lh+NlRY
	 odfQcj9Dw00U2gv803IVYSP9zY4XQybHEQtPhugS4cdn+9oIp3bFXxDPjVswHQeqKobO3DUezhIw
	 DZ9ojYDOlU4zfbVlOq8l4hy1/2bqObxXnx3VaGD5+7CtTN6sJz30eOjxwl0SrOTKDpB2SUKkTZ73
	 zuSBDmF7SpwbVWE1vfgweu7dMep5kRHV4t41e5NT0ghwJ+0d2iyVfqpH+MTd1zYLqBldVJmrm1mZ
	 odoLu9U01qc9w874d/0RfaaknE8p+40Q==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+b0e409c0b9976e4b3923@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ext4?] [net?] general protection fault in __dev_set_rx_mode
Date: Sun, 20 Apr 2025 17:05:50 +0800
X-OQ-MSGID: <20250420090549.545043-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67aa3194.050a0220.3d72c.0054.GAE@google.com>
References: <67aa3194.050a0220.3d72c.0054.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test


