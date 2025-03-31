Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBAD19259E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409986; cv=none; b=mwG1pWZsJkh/eCgezqNsT2i/tEdfbxc9DYJ+50V0TI1JSpZy1FEFl3SqlfpSuyO/eRIfHnng0LrPWqfkyS3y/e0G7ogIK8kq82gjRdbLW088hiGWmE2y2kxUOxrZuhpbelOcARacTGqe7G71fSTO2kPvmiuiiCq1flhRhG+7w9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409986; c=relaxed/simple;
	bh=2Rb5MbgBhl/LXYKGwpqa+Xon91y55iJLtR9YQGBjHd4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=t3Vr+S4Gn7f4TSefVFGnr0q1uog9wsY2wqaYnzx82KESWqmVuOGfxUAgRqGgOGs/FKJjW/4P5P5HcUlsrJXi7qnILc8rQm3Jr9EBuXL2PVkoJxXp2sH2WpWT+NYGKlABbOccgE6RqVFgSwKMoTYBOpIBKAwRwKcbbu2T+ewZtpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=quZaV9tB; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="quZaV9tB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743409972; bh=2Rb5MbgBhl/LXYKGwpqa+Xon91y55iJLtR9YQGBjHd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=quZaV9tB8nWkpZkNyKijHu3btbfTLTnWnDQHV6lUksEr0ZqQk+9/54bMGIpssfE7t
	 uHUtMl/4ygocXKqm8+gfbClQn0xld/l9HWZVoM+kyno/1XeBfgDgITrpJOerlVmPbd
	 ciMN6mE48W01AxZzZ5o+TOt3vi7q0vF5Te1mJrAI=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 7FA17EC8; Mon, 31 Mar 2025 16:31:58 +0800
X-QQ-mid: xmsmtpt1743409918t6ehpvlig
Message-ID: <tencent_5D89C06E5AA49E40EB8FBFAA6796F6891F07@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NoCWsrF4NZy6wGXVRiNjjTZ7AdzGQKAKdUU27Vh+8v4n1OqnfDdE
	 KK4uy5K/V3dc5LbAvtD3geMvhRosrX1VzhLp8/oxZX0vOBhKJgGu3ayqeRkk9X7NdQOKOf61A8LJ
	 EViV9mSi9cN6JVIzUeljxFdAcb2ta4ZlG5lBf+0zP410v/a3xmd6auxybeBAwCQpQytUpMoTxOYo
	 8r/oCwQmwT+WtcAmBN1PNYG0kD0mrl8GuZnKY+xTqs9Y+qBnUDK93FDstbtXteMAF+SKk+LQmgJ5
	 YALvAI3nqYEhC5drR6aZL5rqfJaqPdozYfR+Y3PCrqV0RLDebIDeYsx+8MZB6R/eym8M5YZs05Nx
	 enSAN3mAQZhIpk+0rtukDpKQKAW26cXVoV4HARLzFWL4/0eZY82gcHGa+ztB2NCeLAudCp20npPg
	 ++ZpMi55c8N3TQ+JfHzK06XAHgA2uvnbGma5UBgq0mjGHdRb/2oe5gsSv9xIMW3UGJyL4oS1PWPV
	 3pvrt3GOA41dJ4PJNIUf7JmpXneeVQaZvPN296du8hOgOJ9FJ/r6I0JW2IuwESyEepVG5GUfuf69
	 AP7RpxQdFxQPI9wmH9x3j+5njp2RjbLUf4LGim90XCchleDb8UEFWRa0kjO8C+drK4RzqaLykPZV
	 JoHyx49djdQ7yH+jSv986bFI/QLRoT9Nqxl+Ul7zZ14mErPJfwe9G/kKVZ90ho8Cv3cIpGsiB07L
	 zDvM53bp5CZgyfz0b0ukKjIjh0g5dBXji5yjxUd0NTM9nQBY/UhCT94KJfyDsyuH6Bsysevdcvxb
	 yiNl10XMHEj9o0meY+V6Badun17+4202nUtxcdpQxNc+DG/LcHuweVvjA5lapHhOsHo6rUiYQcpH
	 HndSC2YrN9LgLQtoXPpUpZKlGlKQspDcE8xT3+okeOUCdgTt029PHP7UqyFmxIQ5R3zVlc0Pcsn9
	 KKtzpVOAzUMCeeNWO0ro36Qi2w82Iv35MXo2/pdkJ4/eKq7yWCO4PO96TcRcow
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
Sender: yeking@red54.com
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: linux@armlinux.org.uk
Cc: Yeking@red54.com,
	andrea.porta@suse.com,
	ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	will@kernel.org
Subject: Re: Re: [PATCH] ARM64: Add back and fix support for CMDLINE_EXTEND
Date: Mon, 31 Mar 2025 08:31:55 +0000
X-OQ-MSGID: <20250331083155.120735-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Z-aWdil-GWFC3c-y@shell.armlinux.org.uk>
References: <Z-aWdil-GWFC3c-y@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This breaks the ability for the user (via the boot loader) to override
> built-in arguments.

How does a non-default configuration break the ability you're talking about? If
you insist, why not remove the non-default CMDLINE_FORCE as well?

