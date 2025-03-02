Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AF11D5CFE
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897870; cv=none; b=YZLashPojOmbhhqe/DZavwTatPoM4VhnTg3QWQdRYZhrvcgG9OgSjjOsgAeuqYOVZqYpP+Cswov2o0G7+Pw2OBqmsQgcULULZttMUBTKahk6JgrVoe8uHEt1xSZMNeDSS5cOiWnHpknJ4Tevy8YmAxD/hD4ZbKgSZBHcY0nK8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897870; c=relaxed/simple;
	bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=jtQszC4+f3i3GVMhhHIFTyC94f85yqk/yJZTvFI248cUb2n7Xj3rfQSs5VC0m5osRSGtSx6rBXBd3T89R4S82J/UnoJSlde8AeXUH4bZDnJsmHTslryqb02bGkz9egcsD0xqPdjWXuYIxu9DEBNi/+WSh3RbdC0ZZR3ipsu/v1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=gfHLLbp3; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="gfHLLbp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=; b=gfHLLbp
	3IYSU899NZUGZZFyEh14GszqKcRAjI+kDRN45uQ2xd5K+/gP84FjMz1CjUY4fyc0
	0cOkkdMWDKsbkGubXT1LzSFCqOD88z2sIqSIk6CsdqrBfqwh+YdmFVqntOcyDIPa
	rhfHgfld9yTXndjMe/3ziJwiBsOnwgCVCMyI=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgD3fzxF_sNnkXzdBA--.8951S2;
	Sun, 02 Mar 2025 14:44:22 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:PCkvCgD3fzxF_sNnkXzdBA--.8951S2
Message-Id:<67C3FE46.0F01BD.16940@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:22 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiig4EumfD7fHZhAAAsf

Hello! Rust is better than C

