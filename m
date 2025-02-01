Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFAC335D3
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 03:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738381925; cv=none; b=bdzPytsToIGnvoCQYGmKYGv7/VURyw8antXP3LbFgc3tdLBMi0Sw/OA8wPfKR32xfgEzYkaKpZGA3BV5xC8w/6QCi0urSiywSZQoSOsNbQV4w0udQKpbmCZv4lfAUcppOPa0BL61u4jJlVuQ8fTXpHEfW2NrtmEhBOiDfQFBX3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738381925; c=relaxed/simple;
	bh=5NUV/Smhhra6PvizOc/P+HW4QM+0UoWI8pclAapHqJQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=CFR4zI/QO6lV2xd6GY8+Q49mWpWKMUrhw9ie6ANxnH1kIJ9qi9D3rgUL5cxjZLqHaniAvCykTJ0LujtfYtY3cbAEdYMffiUU/garad7YHhhbQNrTMKktC16dX4cRDrk7PYBx89q3jOu089TsVNOufiCRObtVTIMJdFSYoct+2TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=cXMTNH74; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="cXMTNH74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738381916; bh=5NUV/Smhhra6PvizOc/P+HW4QM+0UoWI8pclAapHqJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cXMTNH741zp65CoyR2PQXviIYiR/U8+uAIvvtG+lex0pB/GFTG8CxAbCXdHmAhtBV
	 gdlYXKTkC706FDxnmBw/6oktH4MAzjO/l3KtnQPRxWZc8Y0wf2Bro2HFGsJgiPIGOT
	 Y7ubc5l1NI3nauzbU5lGiaRqYg8gkfVTLnXB/Z0I=
Received: from pek-lxu-l1.wrs.com ([2408:8435:9930:6b25:8cb3:3b5b:faa2:1ccb])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id AE983E3A; Sat, 01 Feb 2025 11:43:41 +0800
X-QQ-mid: xmsmtpt1738381421tuqbaisiq
Message-ID: <tencent_FA177AC6CC936BE365497DA3A58440576705@qq.com>
X-QQ-XMAILINFO: NKDEJ657lpu+/Wy/r60pZtSuvB5Zya9N/DrB0rW+nCs2tMQyKlqJPYLwKOLDN1
	 V1DKpOk+Eb5Huhzo8I3d/gQ7ev75pAJ4FXzvYDsafbcSJSl/LSkE7Awz/fgCaHMG4ppI8/HoDpb+
	 T83cNJtbruaBc6JvOc6peKORUIKyl5sZ4pVAl1oBz3oEP52vCNB/yVyNhXAaB4/eX4ikNdjRYGD/
	 WXp8Qb5SCIppr7snpeuc7UxeM/k/JqO0DxK4lzYK9aV+dV5JEGiCUTYXFk/k2OZvuyCpQ6DqjI+A
	 GLuuCLOVamEzTcMG9dSPCLNXlQCHzKTv04GZOVA2yIHEHWZCsiAKptPLIWi7keRcm3T6vxZgPFqS
	 BBeHQ17EQKDF9Ma36tnWQpgD6w/sZ8kHxPI/x8ugwJc6F75H0X0aq8hCSeysXLil1KHZM6CpRK1u
	 Spo3pcZfDrVUL0bUfCygfUjoMQ0oBmkBR14Qggmg8R9gDFiG1h8LTDrSu08GXy511PR/PC4LUBbp
	 +QMyuDb8OC90gplFZEV4bM39Gjw07zuWL5DwUQE99N9LaZbIl7SVNmEE7mwQOr6mQWJr0dr1mCAU
	 /3nEMlOXQSRX1PPEm/ziRl4q1R7LrshNCyD+Np4H0qx2yPU0mxkzlmQB1XxIDvLt9fzHRxA8FHkA
	 kgas6nKPePlft6BUs85dC+bWXbg2QY0ahqB/KIBInoLe93/JBH/r6ExBIYmWQWPxzLLaMeiUfWm8
	 1loMBEwjOhO59a3Mtr8yyMiISQDQQLnx7X04Z/DzoFAGMaN0jyiYPIjK6Anuu0GwsYgaU62R0Pb5
	 cImTMJmg3NyzEdh04RZEK0sNTvjb+5TNxRP6IgC2LZN7KAu2/A2rRJX8VlO0i5lw/hJPS8yFCRZK
	 FrC8gudvtgtN0z6FPPFySHUHTIf/jLFaOTyaH+KHv5m09DbKBt5F1tlM8q26Z0dPQbbu/xBD85S3
	 ZNPj7f5K7Qr5T90juwRsm6/jVxUh7zPTYO1VlGVaLm+ARQMpZB8g==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [fs?] WARNING: bad unlock balance in seq_read_iter
Date: Sat,  1 Feb 2025 11:43:41 +0800
X-OQ-MSGID: <20250201034341.849555-2-eadavis@qq.com>
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

