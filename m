Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC35C1B87EB
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897835; cv=none; b=uIE3pOK47QCjuSjUep5hJRWMQ+utDvwKSlloLJ7KY3bSnKFjCm+5bbhjeGh7tFeokQkMLnhuva2kMGEFvzWGny8V5kFQtIcETMIAfykreFe96GDoZ1sPp/mTtsjPt1ylZCd6MFvOGEsvYBIAkwglQIJPBCLzd8OrG/JyeQNfYiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897835; c=relaxed/simple;
	bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=pPyeJ3jFVcapZOb+VwImsVSAMHpVTN+EEIAx6fe7NqM30/rZYZ+5Wb5IDDzdT7PcnkaDeNO73Zx8b9pkxduPAbLJ+m8pIGfiR5Edt0nNMUCbKaDjEA49scJhSoZM1sA8xGJALoYkRjPcWUI50+IZ733sYvb16WURuOpt3j74P5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=a2hs1IBs; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="a2hs1IBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=; b=a2hs1IB
	sag4ddu8WcTOxJUv8uOD7wkPqhas4Xp3wO29k9KXKjVJndwcdfzCrOuwFhXSBWot
	lQSQinikNjMyPOWUbtxf/7kxk8cYvSNLAFRnyed9OUz0Tx0CGPNZWfVLIHMeoO9S
	axYToHmsh+rvvqPWEMVPgvp3zVPOu/HnLlH0=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3V6sg_sNnXM0gBg--.29436S2;
	Sun, 02 Mar 2025 14:43:44 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than C++
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3V6sg_sNnXM0gBg--.29436S2
Message-Id:<67C3FE20.066DBF.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUDPfHUUUUU
Date: Sun, 2 Mar 2025 14:43:45 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiigoEumfD7fHXhwAAsW

Hello! Rust is better than C++

