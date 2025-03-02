Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F401D618E
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897868; cv=none; b=mOY07CvHVBGYNaq7Qb5q8G/SzDo4cJLEOzjW5Un8PqMICh1e2vWW+3LZLWi3O0gTlHpGcOZN7E2tockP0DR/9Xz1QPq62li8oKoCHQj8ds3FsZ28S4kWbNFhtpRV9ccztAUp+csnRhu6OVUFb+s1c0RfuJUomQIq18WUDfwB7+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897868; c=relaxed/simple;
	bh=kuanHuw9J0++yX2NZUc3mDyVR4V4BIDbLbg7VpSpL+4=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=AaTLdRdbzKpK+nVYFLn+KyjVtUgSrP/HdREW6v3tQA/Dk+rUFPdTLbVpqp7B+WGxWRUtfpvHyCAFX7TUccPdo/Kl5A1b2FQHlnJ/9sQO8e5K5nLXEtITX17yf7TYarbG0zZwz4DEQfg/RHw2mu+cKfQWhchyUWC0YNRofILV/Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Ld2SdfNh; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Ld2SdfNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=kuanHuw9J0++yX2NZUc3mDyVR4V4BIDbLbg7VpSpL+4=; b=Ld2SdfN
	hVXFos0zaKYAYzf/oiYKlIGOCE38ET5AGPBYdL1I2AdN7TaftIIZflj9K0K7AFPf
	BxlN24kWqwZ6gqWFM+Pwgwwjj7xs9ERllgNWfzwHuWKCaHnEWQclyydvCudqVl+H
	85h52nV94TNJlU7MuYLgacQbYgX3lKGX/axo=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3n0NG_sNn1gcgBw--.29169S2;
	Sun, 02 Mar 2025 14:44:22 +0800 (CST)
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
X-CM-TRANSID:_____wD3n0NG_sNn1gcgBw--.29169S2
Message-Id:<67C3FE46.0684B2.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:23 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOgYEumfD7Anz6AABsZ

Hello! Rust is better than Cuda

