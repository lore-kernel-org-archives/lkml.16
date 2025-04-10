Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17E3202F71
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295750; cv=none; b=VkfeDPgV78E3RlOlSNY9PPLjvDkPz+Qbz3MKswEuyxX5rxDE11E5A/ZapHTDg6MmvHjX3KhLgMHau3whfw8MGYONMLs1RKRainHGPr11pNdzOeWZM1kYq3+SD5NSSygwj8Q8TFgFxlaGxgMs1OeH3Mer2SM46DndnWy3035jqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295750; c=relaxed/simple;
	bh=5Lo+Vglkm2FGkcLQ+qTblsfPpRfa/Tay5nWPlRyfHOg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Z5JkBxnHTSDaGm4XYRrIMQLElOiGQ39+ngr7Xq36g0c+S+6RiC6huMm23nMz2FnSm8+BwCQAATEOj5D7DcCm2lhv4IvcnVMP1taue0pgT0IvADtipKEFaxjN1eFlpxJSl56oj5pipMkHPfribxThu5+TJP3O5bfouJ6lTCswKWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=f2XwiKYR; arc=none smtp.client-ip=203.205.221.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="f2XwiKYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1744295742;
	bh=AluOD4KVtuKP0nqamRGPQWCvAYc040K52Ft7d8NDiX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f2XwiKYR1pyMdCJVD+FHV8Dff6tEXUE3q+7DXnyWIWoy5wmE2Qe+t2H1+2/rrio2q
	 TVWbpCdjun7Rpv4ewUffkISgKJV6LtZxpEukn7DPQAxeLRW19ZKK/ufOn8sEf9x62p
	 MxlQxQEeZdSj9WFysmqSF0NBCCK+8VnkHfS4lC0s=
Received: from localhost.localdomain ([116.148.99.229])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 76427025; Thu, 10 Apr 2025 22:29:36 +0800
X-QQ-mid: xmsmtpt1744295376tdnj8yrxk
Message-ID: <tencent_74B69C9282D6317927B4FB0C982725A51306@qq.com>
X-QQ-XMAILINFO: NsLYjltVP0elGU9WiQJU6oqv+PNImoitGsxFWrVEJPaF1aTHMULgBf0RTtLTfh
	 i0UPOB3QnHmIU7T26ZeQ/7/ZaqYtmd0RsrZl+1lLqBDT+0JR/DGJs5wcxoYfEFpoz6vL4mVUAdkt
	 Mot2zDoVQ336IX8NzTeDXqGJOKhaaldkhyfIBPKvVgbLTu5zd1y5p4myB3c51GFpejc7ML374bYF
	 eeDwSSvb//v88QnMyG7GrGyGaLTEm5um/JNidAxFldV8k3+Nnq+RwMrttahge5MC9VnA+AZ8z0AP
	 rM12rpe929qDk/Pgn1Xh58LKG8HZhd8K3d3g4CVCJkBsdzIIarG1qA4WE3+Ks/z9rkiEvuRJNn4X
	 GjVLxqShayPxOGYNG9R+WT01T6m4Sk32GHTkL0HJwsLqOjBehI33gXbnJ0UYx+dcW8XxyV4o/Fuu
	 AIJxEzjxwuhm0nBBfbuZIigS/fJRPUxMYG8T1i4rdWIWNOOz7YkSdA+MmuNPAEMUvW9cyHrDMNsg
	 7OakwJatQv8efLIuq9RCA1vWY6hSShlGgYx8XEj5codJ1URLsOP+1SwMnguBu7dnvGVQHAVzPKdA
	 J7P6t76gTFRPGADCdB9P9wsaQ2q1LlZhWQNv08n1v0+q2jsQ7D2LFqXEMU9i2KZaDGhpEpUnVi/A
	 Gl3ipzfmF3Nvx40PkOL+tbcu4PPuKB6Z+qpSCWUhbnZXIUkPFz5DU3LSsAAJiQjDFU3XZZJHY3QS
	 E0qmFaew7KperJre535kgDhaWlMs2ziMrCvtvfb3Nei3BMPsOsn/CYkVgKlOyuTTEpo/JEfVEjRA
	 PMb0Vb6odofefHQIsEUzFJgrynCWjkveQQUPzSZ0A6mnt7Lft/8aEPj+AolRuZW+2IWOkNC+S9oq
	 r1oxIEpOSB4v7hjIoZCLyGfZxNZ+KnRcNK2A9/Knsx8gYGu0AQbX5kR5IfeDqovZYNZBLX0bWVqF
	 hthzYMEofXtWjODPiyYpyCRPN3cuOFwwJ/BUtyWbPoO7YqMhgTCdy44pre6gUm6gVO7FLmXLpOQK
	 U+Wd+sHw==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: zhoumin <teczm@foxmail.com>
To: hirofumi@mail.parknet.co.jp
Cc: linux-kernel@vger.kernel.org,
	teczm@foxmail.com
Subject: Re: [PATCH] fat: Optimized FAT bad char check
Date: Thu, 10 Apr 2025 22:28:40 +0800
X-OQ-MSGID: <20250410142840.964080-1-teczm@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <874iyw6shi.fsf@mail.parknet.co.jp>
References: <874iyw6shi.fsf@mail.parknet.co.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hirofumi

You are right, thank you for pointing that out. 
This is not a check but a creation, and we definitely should not allow such
behavior.

Thanks,

zhoumin

