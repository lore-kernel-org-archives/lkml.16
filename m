Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDA71F03D4
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748687804; cv=none; b=bQab3wwY9RiJYGWxJmVNpSULx7I0DFiMkw3kRzadLwhJGhDlI9DbzvGZ+xjK1Cs4zVJFmlRYab9BbzrrHNcHyWa2BgWZYImAzGYSM+n+G75aHNQvRto/UlqcuOrh4jS1sLXMbutskZT+CH65yC5dCAvM779eHdPnXBtwcbgVYPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748687804; c=relaxed/simple;
	bh=LCCWL2kDcC71cBm4psAu8hEsXTmwFcOHqF7dcs3bdUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAUs3Z28Pag+0uOOgTIgSinI3xr4ch7CaCKhRy64BlOZHwM0fuGJeXWu+onU+mAS7DZgAr17VA7cFvwRHg1BakGDiXYEB+Q96UnA/4ZLLFvwTA8b88O4OJzHzE0eaZ2+mR4KBKjsJGMlO0VVbtjkH8p9GIoCSgHgOOb44o+//DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuruczgy.com; spf=pass smtp.mailfrom=kuruczgy.com; dkim=pass (1024-bit key) header.d=kuruczgy.com header.i=@kuruczgy.com header.b=R1LY447n; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuruczgy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuruczgy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kuruczgy.com header.i=@kuruczgy.com header.b="R1LY447n"
Message-ID: <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuruczgy.com;
	s=default; t=1748687790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxENrXFiNdrr2zkChFJJEF8ySg4LaGGh/I5I68/5WaI=;
	b=R1LY447nICiWNxc1AeI717EBaqxuqxidlYGclnrwaFfXxxy7JHZSSb2HkdRUZnj0JNGeki
	IjULbd61t+yeNxq9FSjgiQQSpKC8tjQqFgA0ngZyh8MRSXM5EiZO8rew8BIWgjKtwm7pak
	7/w5e9hGRvi2wEVhnEYpcty4ey9N0pk=
Date: Sat, 31 May 2025 12:36:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: fenglin.wu@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 David Collins <david.collins@oss.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>
In-Reply-To: <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

> Add charge control support for SM8550 and X1E80100.

Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting works 
well, I finally don't have to worry about leaving my laptop plugged in 
for too long.

One small thing I noticed is that after setting the sysfs values and 
rebooting, they report 0 again. The limiting appears to stay in effect 
though, so it seems that the firmware does keep the values, but Linux 
does not read them back. Indeed, looking at the code, it seems that 
actually reading back the values is only implemented for the SM8550.

Anyway, this is just a small nitpick, this does not really affect the 
functionality, and I would support merging this series regardless of 
whether the read back values are always correct.

György
