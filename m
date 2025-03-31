Received: from wiki.archlinuxcn.org (wiki.archlinuxcn.org [104.245.9.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11AB21018F;
	Mon, 31 Mar 2025 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.245.9.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743426362; cv=none; b=SXYq44noB92WhT2O+pXONnys3aAObR7LMt6lI1y51v7oRAQrIq24DxMs8JuS6eM2DTk4bYtNUEkFRgXdA2ymceSuaCA8+RJ2ayySyaww3oGF6+bpGXEgwzogQos4uTgp0qIeF8AnwJSiZkJXsi+oZFF5nzhLz5STWsdtIg9m27s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743426362; c=relaxed/simple;
	bh=RxzHI0qL1+9jbviZe+8M+OWWl+pVirNRAHWQwUX2b+k=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=iboF++W2iioieUjwfgk/sGnOBgLlhHmHAiPkhkLoCo6TB2+GnAokaTdD9IDWW2YxIzHd29W0lZYzyPaREw700qAmwo7E6hRIu/oENTQwJrDJIti4j8s+pn1pv1v1WSaRMUPAhG2uONFXfKZYU3cD8G+nVbK7gcdUftjKHUa+pwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=archlinuxcn.org; spf=pass smtp.mailfrom=archlinuxcn.org; dkim=pass (2048-bit key) header.d=archlinuxcn.org header.i=@archlinuxcn.org header.b=un7+B9A0; arc=none smtp.client-ip=104.245.9.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=archlinuxcn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinuxcn.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=archlinuxcn.org header.i=@archlinuxcn.org header.b="un7+B9A0"
DKIM-Signature: a=rsa-sha256; bh=XX5S4zih43gG9gjv8zt0auyXHPYRDaaZJku9IVAXD3Q=;
 c=relaxed/relaxed; d=archlinuxcn.org;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@archlinuxcn.org; s=default; t=1743426351; v=1; x=1743858351;
 b=un7+B9A0zWvS/D0GuUBVayjIWOwxleXgPc9xnRbP06l0IRMCeQ9nnerL0UyX9YQQdSqvvrNz
 u8X35+5FS0qRVpz8n3Gz3RGm/KkEp/vzDVjno4UaEx5h30SzaqFdSShw3fIdhRvh86JWws/xC0E
 0kygj5kstcGnmbhg/C3PdSDA2QpE8AcBlpw+rjjm+9624aYqKPUn8nhywIQF4UeCuY4JwZqIT/m
 71ooV7sJe/pWuO6E8sjAKxlURajhPa2H8k5aMQ86XUARxsLl2uoZ2GFOKJa1z0caCiurWQ18Db8
 sz7G0SfTQk89xf9GM/NW+swVDUpkg8BSZUSIjrE6YBIPQ==
Received: by wiki.archlinuxcn.org (envelope-sender
 <integral@archlinuxcn.org>) with ESMTPS id 595a6484; Mon, 31 Mar 2025
 21:05:51 +0800
Message-ID: <eb1abac9-d6d2-4dce-a5f6-d0702ceca103@archlinuxcn.org>
Date: Mon, 31 Mar 2025 21:05:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ziyao@disroot.org, integral@archlinuxcn.org, workflows@vger.kernel.org
From: Integral <integral@archlinuxcn.org>
Subject: A contradiction of "summary phrase" definition in
 process/submitting-patches.rst
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,


I found a contradiction in process/submitting-patches.rst:


The canonical patch subject line is::
     Subject: [PATCH 001/123] subsystem: summary phrase


The ``summary phrase`` may be prefixed by tags enclosed in square
brackets: "Subject: [PATCH <tag>...] <summary phrase>".


The former means "summary phrase" doesn't include "subsystem", while the 
latter means "summary phrase" includes "subsystem".

So, which one is correct?


--

Integral





