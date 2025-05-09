Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A5E26FD83;
	Fri,  9 May 2025 07:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774461; cv=none; b=O+dRh1tbnQC9LhgsKxCGmq7OWiY0IQn/fYzf9TnK3JAmBm480gslbEOrxgJ4u7qwiLNLI4JYUo6wkmBu86eRvHQB3P1lHLmL0XP+FBVNJPbMi/Lh9WIPrNkFDcG4DbuGZ6gEpQla30rOGECYTC7TwtbA6hDr0p9SuVOFMNCWm0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774461; c=relaxed/simple;
	bh=q1d4rES5n4/72LB6mNetdqrwKcaJ811NKB0G5vo83gc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G+SWzowITkbmd7qTUcyqBdPERQzEGQLuhTrmeZnGk9VUkneCI1nDWifAhiu/oLhb7kdPuG7VEgqezUY1y8GO4zaH/S92dIzKv84eFu7emisi0fsW+AynLk26f7XFgpMk0HcGBXxwQgZ5cAVcMebvtgaRvXqkaBGLwsBHVXEi5CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=c+b8oXRZ; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="c+b8oXRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1746774440;
	bh=A4E2WkZBTupHcyT4KzgNgZwpVs0PSeZDi1MEZdWNEIY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=c+b8oXRZxAzhf8fa64B4b15eIVdZvWAoxvtxARI8Tlz537LXze1aaYksi4YkhgZVW
	 ZfDv/aClOsYX8IpZ+K8Jjp4ys7+J4A2IzxogxcSyckVJkf8QTQbngEp21qI67J2aok
	 6luTXJUCFCNbYFcKC0RoekwWog0RR/ICSHR3p90U=
X-QQ-mid: zesmtpip3t1746774434t01fc51ae
X-QQ-Originating-IP: fIVEk/qcaQB4lBbnGcMb5v96AIQWxOerCTDhaK7zj0c=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 May 2025 15:07:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6606146849622476455
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH V6] usb:xhci: Add debugfs support for xHCI port bandwidth
Date: Fri,  9 May 2025 15:07:12 +0800
Message-Id: <20250509070712.276578-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
X-QQ-XMAILINFO: MfzJ8BZ3qEI38t5aKMquBbk2QEVL9ujIK57Kjc+thNxTrphxbxrHeFg8
	/D09dvamKLYPMk7Vl3YYLDzrJCyif1f59hfah+lOyZoVQxo28NbQcSoGR3tSN8+xl2FFi5y
	igPAr2vHkhpCw+PWVcQxViCEzs56iCRhFNJQYDWVnZeO72Dq0lH+4TAEjYTNRG38m6/NOUS
	OUl7Vwnm5gUg1KR6mQPQH77K+3RhIIOxW2UNfQhxSTbBqtQxLbiKayFEIcbcRygr/Nl7wHs
	4WWn3CnTb2wkBLnIdqys9xRV4Jaf3vUQPIJZQdjqV8iAcbeUXX/qqiLPrjles3ecWgPX592
	UcEY7e7dDuj2lLdAXC+HdGJjwDe2azKsRu2cHceCCq2KOkbGFbunQ7S3tBcsXBnfeddK/Fs
	a1iye9iu7BUti8RY02vnRQoBhOSYu4y3Esp+BWE0R014qqD/8mg8/eHDGyG7uDpQkzqKxLi
	YWdAV770AHJeCAUxNiXNK+wsVsu29OYk0tY2xlRgVTe6+3CY3Q8Qwbf1D37xFdJ0VvHG6i4
	IaN48gXOhMxiNNGA09otAC3/pY4isf6GCWhWW/vl5B2+P1WMhGcPMX2x2BFgS4kRStfwBdR
	v/Fk4d0KXbG7eXFlX847tttSXw2RqKDbeAmjqsj/IRBhraUluSpVXB7ltjWMkHIktb5UM/U
	bSE0jcxaCdWjnSBKquViXTgqFR8tweMCT1m1tXWqJFBDEL5pLVay1PpW9Jy8ccujp7oKFur
	+7utqq/TTwaW2d2OLUL3O+O+U/WLo7FORsIv+HCaqmRcWRW+lbzc3N1feZOP8Twap9Adzze
	SyZFn0mf4pjZWx+NKxQqQGyhhodAdB+t0SpEZK7jlzfIaDOqN7OeaPUWkmWnG3xqlMM5cxs
	iz4AVtDI+pTqpbVcwTy6RK+Ni34+3fIEBMc5Dzym8W4XVUymxM77FZB7Z67hojtDBX4j2my
	rvwSb2MTZ0QKx3R5BnML899WibLqaWdW8rvMqfmxFc1vJgTSrCdN/DQ6hG86gRU8pNLVR1s
	4IWiLSi8supS6ERuS3rg2MTIbYcZ5PFODQDxXMuLutHUPA9AlIXHNKLxJxWFukL0/14pmRt
	A==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

Hi

On 2025/4/2 20:31, Mathias Nyman  wrote:
> We are currently in the middle of the merge window.
> I'll try this series out on top of 6.15-rc1 once its released, and
> then send it forward if everything works as expected

thanks Mathias Nyman,
Is there any problems with the patch? If you find any problems
during testing,please let me know so I can optimize and update
the patch.

Thanks
raoxu
