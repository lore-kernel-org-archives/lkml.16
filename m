Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72EB1EE01A
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898742; cv=none; b=qAb/jKROrFSLVWqyaArHsj4CsDq+4QhftpMW1oXfkba8g7lGGYjD5idOcpJSWH5UjutQg3WA8DrZp0CqbdcirW3848OA38bgNBDp5Zv+7uXafpzEtcXrPg0X7zrg5X1fpuY5MRiXfnJUoVDs+ECH5zm8L95wio6tIVLVg6RVwAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898742; c=relaxed/simple;
	bh=U/wIYARQ7kbvgXqE7DzmguflZ6ifai48GUe3iGqWynM=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=gNmu/uo4ViJlNmOOhKeQbXVPrg2hpOvk52/PPAoHX1+QK5YWgiD1ztw7+SSm1P8rrafYbBsAe3CR51JY1kVmeaXl5mZvQd7y5dbL75dXw+yC+GSCqPQVIDngZKiAIsVf+VHRbF7tf2OZLDJ6c1DYJ9hRxIRSeHw5csT3ll40oQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=U49+jc8H; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="U49+jc8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=U/wIYARQ7kbvgXqE7DzmguflZ6ifai48GUe3iGqWynM=; b=U49+jc8
	H62tl+/ynL1egArlWflJS2zfGRHAA+B7GkcDi3eosIKawQP0Yz3n/diEF+VRwt2Y
	juDzSHxnvvFRtC4vonpWRIvFpaArxTNN2om7ICKmTe5mRZPpx+Y3aHBRUGawiSBX
	puvR5USvpc5NynJYKNFkuMX7s8xc7utiMG8U=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgA3v78h_sNnXh4JBg--.11608S2;
	Sun, 02 Mar 2025 14:43:45 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Swift
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:PykvCgA3v78h_sNnXh4JBg--.11608S2
Message-Id:<67C3FE21.0D904B.12474@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU63C7UUUUU
Date: Sun, 2 Mar 2025 14:58:56 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOgAEumfD7Anx6gAAse

Hello! Rust is better than Swift

