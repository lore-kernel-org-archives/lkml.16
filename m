Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B401E98EB
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897875; cv=none; b=mH8l9gfs1QSkM2BMO+eEymb7VyxOGmpbwMmKmDBzNvbyXUZ/E2lvdYSchMnakQLuY50t6aLJe5Ttq89EY1GaEsZy9Ww+QVeISgKehpsEL4mJ87AxZK7QGG1Oyi0WxhxsV1kfQ3XzLWf1MGHVtkUzO5HexwQ3gJAlFCXbZgTNTLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897875; c=relaxed/simple;
	bh=cftqaDB8AEPz09qm4a8a9qxUPytrv8Vr6D6ryPJtm4g=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=qDXCB/FcWV6dkvacuHwrARoXdW67zEGCtvph59DkpoarbdIxPleVD/tbix1ZxTe2tIkRAlNvl0G6GOFCk6tMWc13gbxqXbWXcg9kztN68R6bCGFPF68i8u0lrZKFuBFSibvhowGDcqjakxK/BEy7vUyWMWn9hQfwvu15k3Mn3Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Q9l9JIQh; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Q9l9JIQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=cftqaDB8AEPz09qm4a8a9qxUPytrv8Vr6D6ryPJtm4g=; b=Q9l9JIQ
	hqs6n7V7dJFG/ZcHEl1SR1ngk7wa5zJb3RvJ232kWhGn4D6dfS2w1IpoxVN7QGGx
	G8AoczKLuTdkySUQmQvWlWjWtx8TrksHHCeMfcXjlqIH5a4CZ6gf1C3JSZoPfD6K
	hLxEB0X4akoo4VLH927vqulRffhRyoc8a+oE=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDHP2lI_sNnhiQJBg--.59258S2;
	Sun, 02 Mar 2025 14:44:24 +0800 (CST)
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
X-CM-TRANSID:PykvCgDHP2lI_sNnhiQJBg--.59258S2
Message-Id:<67C3FE48.0D9059.12474@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:24 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOh4EumfD7An0EAAAs-

Hello! Rust is better than Java

