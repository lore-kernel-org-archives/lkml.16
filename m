Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC0F1EB1B0
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898740; cv=none; b=TSYpgXmplJ/ydhrWcpZhTLe6Pp2Mje7dp5dWa0bFZLsy/OmJEm2/yo9rjBJVs8Blzpl195DBwtL3HHbc0Lf87K+YZ5TVZsd5c6N16xNYaTaBAjJz8GBC1uss8+HPJlYnFeO9O8eEHzdYE7Gqp7a3wvV6qlZCLktHOu1Wy1Eazrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898740; c=relaxed/simple;
	bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=dX62dROj55kIuGYlp1F/aYJn2UZRoAF+OR3BNTrOzXzAD7sOB0vENhk9YJF2PvWHCE6i55B/900hoy8Jbg/CFnqepEOwWae4RTzM2D9pj93YJmzOOSalLyWENhhxpXv0MkTrHCZjwq3LJhYORcLqX8PZnGrsjHPAwbHnuzTQWCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=cXTOrdkD; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="cXTOrdkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=; b=cXTOrdk
	DSbHIEqkqbX69bRia2n1q8Br83g/9PHdhq75uJuvvykwiAkVpoSfV28+PETRTo3K
	LsA3zdej4VuYSfojDKA/ypoSN7lNypuBzq+BafLwJwahv8YomrYZc6v2AvygIsKv
	3kOH6r+NP2J1fn0+wtBuUjcob1dvjdGxstLY=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P3wj_sNnJPexBg--.28777S2;
	Sun, 02 Mar 2025 14:43:47 +0800 (CST)
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
X-CM-TRANSID:_____wD3P3wj_sNnJPexBg--.28777S2
Message-Id:<67C3FE23.07181A.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5fHDUUUU
Date: Sun, 2 Mar 2025 14:58:55 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifgUEumfD7erXugAAsL

Hello! Rust is better than C

