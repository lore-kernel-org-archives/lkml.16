Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0172D1EE7C6
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898746; cv=none; b=cnZgprANCdlL0KAIq39ERzT0RzPBC6vvcSNg33goBr9u+0wDATAz+1EZoGnfehOtqWVihxFKXrxFu5M2fwSrUNsM6jldNefHCWYkx7vFjf0NgO/xDjcju6eeIqsLl1T8eSDqsF/KRQHrCSuZEi3wXcB+i8t33NInHC8bBsJdPw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898746; c=relaxed/simple;
	bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=HEMjkQLa3yAGW2jvoM9AIZpOTKgjGInjKWYtUu6NWl/3dawM2mN+lmJMWJWiqfSBc/0nFZpUgu/glq7ofBkNOGilcFl1pdu5/L8Z3Lll9c/qiSyz2cWVL4QPOkyvQMlGE5wmtCT3qjzaVhr6FPkG4v0wei0nvmnW+YMoEszgb10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=cL+/zuD2; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="cL+/zuD2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=; b=cL+/zuD
	2RgxH7q91RZNWwogPQO41T+koIA6VxbUAoDjSkIxqMBLXYgx7CxHBkCX6Rx6OdoZ
	1GJCxx9PUp9Y1W+T+7pB7NtBGl0QsRUc+YKBEnbA+6GYJ1IKXygNQXFTc9jwjTqw
	ySYGQBbontLAFSCBbHiBYOjkaIvz0EwYy7JE=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3XzIg_sNnABQYBw--.38112S2;
	Sun, 02 Mar 2025 14:43:44 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Golang
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3XzIg_sNnABQYBw--.38112S2
Message-Id:<67C3FE20.06FBD6.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUToUqUUUUU
Date: Sun, 2 Mar 2025 14:58:57 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOgUEumfD7AnxxQAAs0

Hello! Rust is better than Golang

