Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075EB1D54FE
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897867; cv=none; b=s2aP04Rl6O8yfvcW/zV+PRiZCVdUNQbv6FqiNbXcaBVXR9yIsUyXsuPXOBB1uYxxTop9S2BgV/7XRXhAcSaxgjcYLimi8+WfrcjHVOGeBi7Lx51/ToUYPADvGcFdjAyUHuVCvN3auXOWWBb3eT6oko6Gq+k2/UD4skgjg6VZIow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897867; c=relaxed/simple;
	bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=SutWZURhb2PQqUzgmqV5r3fNqwIs3eOzGOJcfxvK/JHNWmLCXPF3uA6NiDK/+Yk/NYLiEeQ+SQfQ2sivx9REwZEv21FJGPICIZ2O0LXMMdgnamk9ncrDRnUkrPt1v7FiJ4Qals7jlpeJo5FKK5OLrbt2a0vf6ydJrcVvI4aL69c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=RqBqPut6; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="RqBqPut6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=; b=RqBqPut
	6x9u0uOw7g8S9Gzx/rrDNwJwOrrbaaTEk1YLrbjqnwd6oAquZl1H/itM302f8aMJ
	B0F8LBvNNtymsNPq3QH5sZTMusKKAZRBOkPo1TOEPAw9L5mSTLNezXIQNoNiKK6J
	jx/LFVb3sAHEppmk7snJywhm+6sidRlRo6D8=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3_6pF_sNnYtMgBg--.21812S2;
	Sun, 02 Mar 2025 14:44:21 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than CSS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3_6pF_sNnYtMgBg--.21812S2
Message-Id:<67C3FE45.066DCA.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5x6UUUUU
Date: Sun, 2 Mar 2025 14:44:22 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifh8EumfD7erZowACsE

Hello! Rust is better than CSS

