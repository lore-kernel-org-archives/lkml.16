Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A10A1D61BC
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897871; cv=none; b=gNcTvcsVhwK3HELp2XYlUZXFUgVlsDAqeFv0Mf73eW4S8jRBns7z4HFU1I0fT7ckd3Makp2Q3D1AtSvW611ZIVkoBEGQkAuk4x5U9Crq8yn797iBlnM8T+5I8bQFIcaT3f1QnlKO0YZO06h7xXuR639ilUpRKZpih2dNEezC7Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897871; c=relaxed/simple;
	bh=PchpREbeVuSu33VarUHMnUKVR1nscKOKnSIs1Y8iilo=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=RUwlq9P0J3ISOOJpM86UdshXiFWl3AhahpBEIVtWl/8jNw1uR5LQtxF+AEDioPW4T4mAqLbUJ+QduX6b3RzGwORGd0BNJ2YcTw6wZ8AzS59N0aus4mMrZgRq1whzNWtkfPkJPgY5drFlSny0NT4cOl/j8Jwncjo8lmazf3xXDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=TFmp8GNO; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="TFmp8GNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PchpREbeVuSu33VarUHMnUKVR1nscKOKnSIs1Y8iilo=; b=TFmp8GN
	OVic9dQdhsGhu5UiSlCxqEWJJjaXHjJlufHgmj4XUGMTw1EgT057v2A1z6tu7VHb
	JPZ8W4cIP7oBMQHHN8+bbk/vMz3/zUvE9CxDTaSiQIq9YqdP5ZmlVLFhjouWhP5R
	5oULfMDy7a3PXqoQA0BpBstcapPGk1J1THf0=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3VzBG_sNnqOU4Bg--.41378S2;
	Sun, 02 Mar 2025 14:44:23 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Javascript
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3VzBG_sNnqOU4Bg--.41378S2
Message-Id:<67C3FE47.065276.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:23 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifgoEumfD7erZxgABs3

Hello! Rust is better than Javascript

