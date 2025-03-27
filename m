Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C411A00D1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.155.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093724; cv=none; b=PNa0P/k6+BYfdbV703sHv1MaYawCvAczeBOStC7nKzxOiQct1HmnSZ/ZMf0NJqUtoMC2WjPbuo2bwervAMbkHfFTiUpT7jYa7R42KFYHIX1O+XD2m2KMaC6z2+jSIt4fQmNHKm+iV6Zqtpi1w8zjTsZ6wMO9Ys4D1S7GVZx7Wac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093724; c=relaxed/simple;
	bh=bXMcNx8osEeEPQYirw53krVK4HRxHdx1PySAzx3HRpY=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=J/F4BSKnH11WeVFS8yNTT+OGqJywirB8/siFTlWNQPQ/+lsLTfuqnAl+LWfraJGLsrSxp9w2EdGRB5DzGYBEPFwJb/2bm+j3D2AqQOLfnDV2kB1jXClHbKxvMnmHz9yrIyglF6oINSzuaOQiJ10UQVn4usK8rt8vnaQef4HUv8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b=daT0k6ta; arc=none smtp.client-ip=62.149.155.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b="daT0k6ta"
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id xqFmt74pWvoVFxqFmtfKpE; Thu, 27 Mar 2025 17:38:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1743093530; bh=bXMcNx8osEeEPQYirw53krVK4HRxHdx1PySAzx3HRpY=;
	h=Date:MIME-Version:From:To:Subject:Content-Type;
	b=daT0k6ta4kuV4wQ9xA82ldUP6q/zo0eCFchrw8Wpq/DyRhGxke9MOg+QvfZ1qZG9Y
	 KDTGvQbh/tF3b3CTkAC486kzhD2scyz7A7jERH85nxNzxL9BeZn9uYgIvamS34Gx3I
	 FO+pxQnt7ZkzUXI3BdSuX4kG3sWyUVehf8WIE1R3AP+N+RaksBb2t4H6Ye8yfkzJqk
	 1FlJwzqiULIMtyQeSgeY0U4USExC+M9OQsyygZ/lnbrvZJSoYSmqg0YyW1UWTPk3eW
	 IqycRMmivIt/LS+5Reti0jTKeg5YIgw5DpH4I8wzkYhQ7kiVHiThpqTyYPqf4cwV/M
	 FN0bMrXLc0S0g==
Message-ID: <0e203dd8-f506-4537-b002-50bf689e3cdf@enneenne.com>
Date: Thu, 27 Mar 2025 17:38:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Rodolfo Giometti <giometti@enneenne.com>
Content-Language: en-US
To: linux-kernel@vger.kernel.org
Subject: RFC: nvmem-tool
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH+XyI6z1ZU8XA4ocGsfTe2gUsqZml2iYlkKgViPECh7mlfzIjxGW+A9Op1reNyM8rhLmLmlRjdPUBsrsEkjuVNkSS1zuMxUUAvencvXWzD8xW+LInzJ
 0ULiWJpowXKsjGVYQiPoZpz2ukgGB/LiRPCpIa1mZdmzp5ob+sJGzcLY0Bi6pn+17byyNQkfd68kRSC9Zi45zStDsVdQdhwXBB6+1+Fx5QtFqgjHH/e+IUaU
 aAi4NZmtHQsaUZtz5yFldQ==

Hello,

in order to detect and easily manage NVMEM devices, I wrote this little tool:

      https://github.com/giometti/nvmem-tool

It is still in an alpha stage (it supports legacy and fixed layouts only), but 
it's quite functional, and I'd like to know your opinion about it.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
