Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898431EEA39
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898746; cv=none; b=I4gIqFqfUG73d6eOZyC50LKXHMIIIHaIglqxRne1RqbTt93arJjPK/zIPdsJjWUpbrxwtNqwq2y6J3BUInKDHL6lbx6C/zrnB3/JRquwfNoSH1c8qHvIi0itolh81lE6Xfc+NQAwTWQOZJ9iyWcnOBctsGJD5ZntadQvjUADhn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898746; c=relaxed/simple;
	bh=cftqaDB8AEPz09qm4a8a9qxUPytrv8Vr6D6ryPJtm4g=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=bmr1mQOdObTwEwCupsdCt95MoW2W0z9Lt5HUuYj3Q0VSUZDRtNUMprx4uTXY3fzPOGK3NV+eHejz/GYj+VoEZMMZa0CbD40zhgaXsLso/lxCv8lL7k9WW9ohfWTrD+3mS6AtPeaZ7DeCUU6FZsYiNW1/kCgWO9fkKUTM2qRoHVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Ud+fDM5l; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Ud+fDM5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=cftqaDB8AEPz09qm4a8a9qxUPytrv8Vr6D6ryPJtm4g=; b=Ud+fDM5
	lGO5a2h64y3YxwPPHybFirehbyFqyBzAqGAHZxyJ2fkU9c/9m5jyjDIspuws2vdr
	+gAE4ogbNvs8qy+Qx/c4gA/Fn5QgKc4sc6lD7fIdreOTaAU7WueqgZYZs1t5mGH1
	nwm7EvyBhU2p1/24TicgVifDjWBuYOP17B/0=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnfzsh_sNn4AAgBw--.29620S2;
	Sun, 02 Mar 2025 14:43:46 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Java
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wDnfzsh_sNn4AAgBw--.29620S2
Message-Id:<67C3FE22.0684AB.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5fHDUUUU
Date: Sun, 2 Mar 2025 14:58:58 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifggEumfD7erXpAAAsY

Hello! Rust is better than Java

