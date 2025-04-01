Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A913F1FBE83;
	Tue,  1 Apr 2025 16:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526029; cv=none; b=SkfCgro2+5OkhJ3Yy/DWfGkMjoXkyobepEe+WpPl+1iAE/M8f6RJ64HjZ/4qKwKLJBWRTJOxo5E6qHvt/Bye1n+conuNaReZLBb2VG1xrYwC2qkxKGq7RwK5wVtFSFXcietWc27OC7EP8XDkVn4tj0K45y+b1oTO+v8KtAuWndg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526029; c=relaxed/simple;
	bh=a6MFPOblanBjv8HejQd+RDyGK+ufnxyTPj6oKXkPptE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=L4Q5Ajcy2kQD31F5XmIXwyFI0LloOHO0ZCtXNQ/IUWP/D9ZMgPAvwxShKCVJ+DW+MnU08+/YLtsGl2v9hMRZfP2vOAPXjd73fXVNUi38EDENz11wSZln5/7wwUat0DuFeeMrwCEKr2MPPJdIo/hUg/gtbqfVle9NbRzi6qDTRDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=r0lN0vQd; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="r0lN0vQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743525973; x=1744130773; i=markus.elfring@web.de;
	bh=WKBH7ZnN/oJER/hjnFN7pP/Ka1YrlQ/HQDnv3BjczOI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=r0lN0vQdvYzOxPxQhC5hkIb0SjSUjXVUNgqEPEi0rPpr1sWGFE+LkWS8oWcn2BND
	 wQheoEdHPJBz0y+izX3vM/j3Mgzchh54PvRWHy77gAs20SHz1HJAxOACPdswe9VUp
	 Y+Dsh+7tI09s0+ft5n2FXEXjKolsegcXL2oGvAPzLBNudUmDPUsSzjtBviuS+chnI
	 rbOTBP3CHFVxscI9g7pNLlJZcvICK/uVAuvoJWUIomXgfgWnJOHbhCMDVpVsdy14e
	 1apYUAdMYfhL7tKGCIE9RYv5rNcm50yRP5d7/vv63HvR6LGKqlBOsiewPxE5LLSmV
	 BUZSg2Is58rYu3Xrjw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.54]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mcpuw-1tR9HT1k3O-00bcaG; Tue, 01
 Apr 2025 18:46:13 +0200
Message-ID: <57fac291-6d7b-40e8-a4bf-8b8704662b9f@web.de>
Date: Tue, 1 Apr 2025 18:46:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-clk@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, David Lechner
 <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
References: <20250401131341.26800-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] clk: davinci: Add NULL check in
 davinci_lpsc_clk_register()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250401131341.26800-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VQroEZlMDoo+6n6ZIzp+RndEXyP93F7SoRr6HX6AQElj6DSOcr6
 5yCw4l07ZSHLXeckkiFrafshqWQQwR9QoL50TWll9c/28opPI1d7MbAS6eLdJ2jLw0Ncb1D
 ED56d92ljqKd+CYv8vrsZmSNR3eadPiE8Dg9ulb77WNkphmooaogMg4WqCJBlKxlsvdFXpp
 ZhwQ2sqvk0fWSpqAoXTbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:syYlzGPsx1c=;QDvmaDAIUJWsuRymyp11PrjalKa
 VDkY5lj3KMABx1XZvDtgSKdqb6lkuwaD3zpCHcmXzYzoOrmt+akjj+odatC+bATWuSdWZ6suL
 JF9cwkWtGda/Yvxm8CvKhGfOhq7Fycl4GJNzA1/mUnSYPXBWWL5UBdoDJNLtGl2iI9zCala7q
 VYDFJbGIXpa5jlETQV/7Qo7Qs2pKVxFKdcU2zf3+Cn6Q9jgxJfl0kPDdDhwn7ftqQOcluRwpk
 jzIOlSbCxE1S1VTGkE/0L9jUvW4OR/xR4eXPr1aDVKOFkropDGVlvcPFRRpEBIYZJ67MIMkL4
 FHkxt96Oh3dt0kY0GcNVmZQRhkeLNRJelYAt0VRKMpEtPYj8XwDuLLIqFBsghl3iHlgr2t9H6
 1uQwWxlXHDVOLjxy6cMg/VbVUGOEv3m1BfRq8ceLc/vK8VNS4jj9/NecxZbKr1celVeS1s2XN
 uFIBFOGIn0e/+SPD934bbaMR2+x+fIixGnAeyhyqx6YwnG8PvQ9OpQcEHndH93t1e3fdwhgJm
 iS3o9+P+Lv1r2ZZCvr8SU9C4I9mGSvAlswVbySVQ+d1498hjqdzvveSYzcFzcow/wc0KAgRLt
 7N69P3C0q4ZIX1pgmK6sPD7nf+9++VV7+iS4unO/FAQpODmeMRokguA+2LvjZjQ/6Gzd7L36C
 Nia8DkTzwarFq6uLAzQSYKVK2+Lc+7tbwxIO/E02A3EI9vIpPvqZj8EJexpGHLOI23ahEAOWf
 OzI+Ao5RUGBPSsuZQ6tuTBCoVURU72MPfnuQcFBhffZRZhH3YeHK+dAlQrVJCsaFCzmt+hkH6
 7zEYDlmdqtStdsbtG3fvZ8RHqnq886UT003f89Yxdy3kXM7SIO/1dAShSJqpx9xfOvRgm91V6
 Jy3jgM0DwtHlldHmMiZxqfbnf6gXrLwe6PQpTiXlIgUyA2Kc0Dpd2PG3Ex0rf1ZbJy+4pQlr4
 wL79HF9H3jxFG6yHgs8c6ufb48KYralrk5cLSVvwLzEuhL7f1BlRNaqPVsUKJzP96byZHNwqa
 9Y6q6TklmTVTPAshrvJO99tPSupo094kUlZYePhmPBYfwE6vpvTX5k6Rk6cVtUhduwnsp18a7
 9M/T0qYMZuW9p3NBLOsjIDsAQXn0vtyLoIOmvRxzWx9mrL/VRmqxrcHPr3Bw13Rx1aKS/xJsl
 D5SsXX5lBiMuKsBXNwmTy7F9hkywle8472qpFhc22wItaDICLBZbkOZJRpHcXMV+yp7VEmR3Z
 BRIpcLXU6pDEvQZDWj1OKF9EfJSnUxxtzxCy4agtqgC0rNP7NGv2I6blbhA2tWHlq+Jn56/KC
 HFLKrLyRj67LP2sb6AjCvEbOkY0TN+ZqSntBJqV0Y+S87wKELrT+Q6b4K1J7XmvkqJqYn1HAU
 WjUAbkBZ5d8oNZfMEyDcSSSFZkWG9kh8n23ewRiHB6T+idUZ+MX1ExlRsOdWm6Vncoumcx0RR
 mMX0/Hh70JSm0nSqJVrHXhVIobSHEpHvNZUNmNy+Ee+70I7+J

> devm_kasprintf() return NULL if memory allocation fails. Currently,
=E2=80=A6
                call?                               failed?


> Add NULL check after devm_kasprintf() to prevent this issue.

I propose to avoid duplicate source code also for the completion of
the corresponding exception handling.

* You may avoid repeated function calls by using another label instead.
  https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+=
goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resou=
rces#MEM12C.Considerusingagotochainwhenleavingafunctiononerrorwhenusingand=
releasingresources-CompliantSolution(copy_process()fromLinuxkernel)

* How do you think about to benefit any more from the application of the a=
ttribute =E2=80=9C__free=E2=80=9D?
  https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/slab.h#L=
472


Regards,
Markus
