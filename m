Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF43232
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743465671; cv=none; b=i2ObvQpoLM7Chw3SlXQyNivttDU3FbyiIc7HSqMxpv8nNntZ+xybJhcYpccSYOojW89z4+lf4a/dU0ZPUTnIbRfT6z5xoUxE8qunXHL2jaJXULeCOwzOEHxTgKQ9/NjmyGWJ8wRW3h9jRnqjDblm2M0iD4TGJfLGahs2D4LxbOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743465671; c=relaxed/simple;
	bh=VhpbfB5EOBC2gL9TliKM0AdbNiSfILDVrV+94oAAR4Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jxtX5l5ckqvPW4yNuDo1UcBIfGQKV/rRX9kA4zKhb07AuqwIdBe6VboXB3S15t9Eo87DOLrYrm2aMAmwCxyqWkfMKb+WI2urdNyxjMhr0Zlxj5abY2Rg/q2pjxvLYRTdoxgJW9ACwh/fgR4UOCZz/Z9B6owftGljIB7Sl8YuROA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=RpatiPX1; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="RpatiPX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1743465667; x=1743724867;
	bh=VhpbfB5EOBC2gL9TliKM0AdbNiSfILDVrV+94oAAR4Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=RpatiPX15PPlQwoqc+6p1GcBS3ZMsFiQEPbY683mZ8PtSRWyAUufUwYc0vMVjbgqr
	 khf4mFL0hI2AOlzlDalaN+258HDvTF/muit4yfbNf52/XKKvETH7Dj6gmMUmmGua9d
	 2CkBUprWDUXxnT9qT2NpcxDbriCA4MaJ9rfMgAcwsVehdA/M48oktD7JGkkNVA0qZe
	 cK23Q2gZj4m/Dy9GJivnafWMn1XXMqf/o4uSUHKtm+KnjmKRvf4ZQm4AzKqx7dJuTX
	 0RfVJMnNJEiU6Xd/RL4P1JYfsC9Wrk9aeIPqWsarKW584y+gzD0oIS1bZtyBorce+s
	 oXL/oAofbUs/w==
Date: Tue, 01 Apr 2025 00:01:02 +0000
To: Christian Lamparter <chunkeey@gmail.com>
From: Michael Pratt <mcpratt@pm.me>
Cc: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Pratt <mcpratt@pm.me>, INAGAKI Hiroshi <musashino.open@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] nvmem: layouts: u-boot-env: remove crc32 endianness conversion
Message-ID: <jHcOHNUeNje3fdS9Rr0LTiqybOu5pc42PcW7oovHdrCss8pgAeqCrMe8qwEcyrd18bnBaOipE5eaqrC2tGQZ5vme4_KJ865UQa7lJTJXQIo=@pm.me>
In-Reply-To: <20250326094034.18716-1-mcpratt@pm.me>
References: <20250326094034.18716-1-mcpratt@pm.me>
Feedback-ID: 27397442:user:proton
X-Pm-Message-ID: d288ef63438576040825bb6d48f9b16d80480fb2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Christian,

have you had a chance to try the patch?

--
MCP
