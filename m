Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1BB3D994
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897834; cv=none; b=Mz/2LoYt/VOR8MK207MAw2wOgPRScksQPM3G06nrYQHN+x82lpR++/Fzc5ye63z8I8CatxqQjCJ0bxnzIoL04325mqgAcDOnJUD5PjcanRzVlxQ5aLAPB02hNFaMPu/RmNd5GBzlDxGGVA4R6PnD0HnQCIYBTJP9STRScdJo5h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897834; c=relaxed/simple;
	bh=kuanHuw9J0++yX2NZUc3mDyVR4V4BIDbLbg7VpSpL+4=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=Db9c3hf/ug3eiJmMnEmxWqlpJbDuh3lzHXWxQcHbocP5b5AngdSABrmuXJv43JMF1PirjIOeeLNrGHpXcKHH98NrehSMAOeGhGJYfEP4dVm5HKeK3NuZmcWIDZVfkhvoxWGENOMlnx960AVWrzGyp8rBWs96YX+ABnVeMJesgKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=kh3MFEBy; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="kh3MFEBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=kuanHuw9J0++yX2NZUc3mDyVR4V4BIDbLbg7VpSpL+4=; b=kh3MFEB
	yvkO3Cvxw1smWi29LhY7fp4jb2Lex9+zW7VGLUuIIAiI/Sc4zLhXA/+99H9Qd3ph
	V5lNYpw35uvQH+3mqUeCQQjgJuWNEjiKk8uRSNmJWFsxkHgFqK96VA+3aF/v7Ow+
	hpkw7/IqqlGvTpMsdCwmoN3JOk2gwbquLd4o=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDHz2Qg_sNnMx4JBg--.59373S2;
	Sun, 02 Mar 2025 14:43:44 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Cuda
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:PykvCgDHz2Qg_sNnMx4JBg--.59373S2
Message-Id:<67C3FE20.0D9047.12474@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUDPfHUUUUU
Date: Sun, 2 Mar 2025 14:43:44 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOhQEumfD7Anx1gAAs2

Hello! Rust is better than Cuda

