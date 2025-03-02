Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A79A1EE007
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898743; cv=none; b=iu2RCxCat0q+1/QOUAVIPYaboF5Murr9E0oYOfBK7oIkxJ4VxfUQ5ynmhJe2ZL3QqH5g4j7y/qGi+CRjOVT6T+dvLUXHrY6LLDpyBjL2PTQO9FHA/R4Olhss/vpw+8ViaRXx36LBWUJlJZJJSBT9p3wDoEEQ3VH44nz9ToqxJTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898743; c=relaxed/simple;
	bh=PfixNPQ/uTp/hFvZCGY1TVY84A7zL5WAfQIAbeeaQe8=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=niT12r+eJdziNH/cptH5jyUnRnthLdyJ5IPrmb3XLlFpYISGZ4/dP7z/wCTYLiZQWXtUV8FHU+Roul30yan67/i7WTPfhUK7KNm5fMTB0pRltZWDyr3FoTzXuthAsDgRJbDeZsbvmG7L0X0QBMtqKuuKj9o3dwoNkf9W1LbGOJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=B0x4mbCb; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="B0x4mbCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PfixNPQ/uTp/hFvZCGY1TVY84A7zL5WAfQIAbeeaQe8=; b=B0x4mbC
	b1d9BfM3FukVqG9y6PnmQFAcdBbo+i16VTxxgavQaGl5rYU/yhRO6l89ABh2xVMP
	eYBDM/MvlujP3UHYigj0+E11O4StFLyRiJFxAz5rbY/ac3LonNtHncfJrnvnjPAC
	EzS56b/cVqPp41T9KKGOCspMzbSiVFxepRlQ=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3ry0h_sNnwTZkBg--.41106S2;
	Sun, 02 Mar 2025 14:43:45 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Python
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3ry0h_sNnwTZkBg--.41106S2
Message-Id:<67C3FE21.06E753.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU63C7UUUUU
Date: Sun, 2 Mar 2025 14:58:52 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOhEEumfD7Anx5gAAsD

Hello! Rust is better than Python

