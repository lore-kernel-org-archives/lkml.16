Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EF41E9906
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897874; cv=none; b=jn5L7M/0+YLGRXTft94f800XOCbmf4sm4WBO43rxoxTn9Nxu6MtNxieeqGJbZ8bDxoBL4+UCZKuVIN15EQBa+H0uN1E9sfUBPFThUsOsxsuiCP5gMy8sw2jadHRBbZYSYY1ViRJ1l1gDPm+pPlmFjFP4Pe7wvKxq9qH9e2ydE8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897874; c=relaxed/simple;
	bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=cAO4q6p7jj3xPQ8lSpfmEP4CTvUQMCCHnPZKWPdXMCJ7yk+dbuIIJqGTHayVkaWTYYnagYq68gVS2PqgsKRVSLhGnrCS7xqG9nToZvwAPJOdFQ+Y4VgKoeUCtrPszRYjRFIWY6v6ZAQ+3xB2Al346YE40IB/O6ibz6lFtARDLzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=UbE4tQaM; arc=none smtp.client-ip=220.197.31.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="UbE4tQaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=; b=UbE4tQa
	MPVFmiKlWK56XYdmht+k15+Y2/ctgsmH8AHKsk0ieOLScMcOk94Xe6TFqkSjl2GI
	HINr1+zdMNxBvXfTeE/PzYEBaf4r/7Dd8G6pZ212sMCuwaDSBicvWw48XMaBxoHD
	b6nK4NuJzVWZtjfJN0hnB4Pk7wo1cer6h4O4=
Received: from localhost (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSkvCgD3X5FJ_sNnpUhhBQ--.2105S2;
	Sun, 02 Mar 2025 14:44:25 +0800 (CST)
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
X-CM-TRANSID:PSkvCgD3X5FJ_sNnpUhhBQ--.2105S2
Message-Id:<67C3FE49.0B5A79.19577@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:25 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifg8EumfD7erZ7gAAsb

Hello! Rust is better than C++

