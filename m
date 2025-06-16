Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5732F1DB377
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750092294; cv=none; b=qOgmrVdcVkVwNlpc2PhODdScXen8w2iH99d1WAmUlVwbc1Cbtix3MKYGNjyHW0C45bNeb+9IRiKt/x9QAhenLkzwBi6dl1FTutYrcCLoq5rLRlu8FWPIrEU26G+0t6BC3dA9rstCQYvxpO38pS8/PYURotg/1hzXwnGymZUz5gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750092294; c=relaxed/simple;
	bh=2TD0i2ana8y+qF9gsd/rS8HjMtpUN8ygxUF8OFmPzsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRup8GNGa9rrNmq0f853TuxvvRRFWSJi0yinI9pUbDbasSc3zPAy+i61e1ebgGD20+GDnEaVXmIEgZSgUehyGFQ1+yj0ZxJrNoLvv3GkpcyseSM0E6EoTSq9yxUAmWAMnq5CxnQVPAUbyxW0umQhQ9g8o0nmwQO0seGGegjx5TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzxXmFWr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzxXmFWr"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-addcea380eeso756994466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750092291; x=1750697091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ApXU2JCKiCyQJdj/JMLowQ6Yg0sLWVVznw6X8Toq4o=;
        b=OzxXmFWrf8YNn85psl67aCexyjzveVQs6Jj5uAJ2pO9EEDNT6W7at43pKsPkhPtdkw
         28EBxWRdRJXWeU3kn9F3Yynwjgm5/w3HzncZPP1RoZFiTJzAvL4duvocwSYUEqJeMrhN
         3BrMEZxKA/wEggI6RxqN1SAS3OxZmjKzJp020rCsYwJogrD08cYDrCjBipGAfB1esLYp
         fcDlU7Bzdgyr/ilm74RN3lNST+2mYv4eRyy6puckJjDowdiPqHhlMB96alxbI1fBSO1M
         C2aSLxpdkVt4dtGVvL6vFY1mKgaAGl8ClUDACzOJRQzQKDMqNQSluVRbLV8xMACuulRK
         E51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750092291; x=1750697091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ApXU2JCKiCyQJdj/JMLowQ6Yg0sLWVVznw6X8Toq4o=;
        b=SYn8sJmAZLsXHHC6I0gL5IcoGNglIM3aXJm4AvAW1GYAr1wP6n/SM2VNiag5D/2dAe
         P0Lc2wXvu+F/BhVk5oyRO2pfSqdLjNM7aX/x29hOfRdG6euRSUXZx955hTL42ZR6iwGw
         +CdWTVPL+EPttalxTromH5fbGs1QVHsVFxyycAk6Zm41OYal02ihYQiVgenrWVrzNCT9
         96zD1jRcvJSDPK8XE0QXfnWhTmmi8tnLGNvLa52PrMYzOOjkDxGiw8q3zSJDIudDYc+e
         3aHzyhDNQlZ499NpAJtrqUJDwaTA88qqEeSBlqpca5/tb2CGzkBsP4HqudyQSoTWrulT
         9z/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaZ1pTvbBJe7dP464RDo92XsS5fWaoy+hEw6s6SGlYjCQ5CLKwUyCokMsjVsIQIrsk6bh5xF6oIks2ZnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz4jvKQ2yfX7c7jnaoTgd54qZMIeSWG4UzYX/sbPMhFp6uA9QX
	Mr33ziHbL2gnacUvz7fG0gqqXd8TeEh8/Ziz2m2X3rjXXxte2OukWgWr
X-Gm-Gg: ASbGnctB1PZ4vmJ1oXndiBvwKOpmaEi3q626M/Bz4yRSccUpPVrAnSyQALoe4CteYZT
	EPpQMi+UGpfVeYW9wgdAgQvi1Ll0ws+PyHDFrMaDtZOp1Fd0JHMEz2MClt4iSoav0qB8tPn4tma
	UyH/lJjVgcwXGRPP+eZVgcMju4nbJGO+jSLxhqMq39NPOByyuSyDm967ogtPjpEcPBJ0rKwus5U
	2z40CIMCBiBaMWv4r0mGXWyTfM+72oAZd45UZ6aue4UMRkTYjQ5idajmprzzhUJj5quxRP0ydHR
	RfeQ1sZxTTxCZ+il/LMb3eDgVPOwR4NRw2rBbIBXWm1q+s0da3R0GEFMkkqG8KjkMSmEcvOkzIW
	JdFlmEkoXZ3k=
X-Google-Smtp-Source: AGHT+IF+57xX1n/ra5g/CQaBFBx4UgdBiS9Nwy9eIBGYf/AwZ/BvkEMIPnPe1+JOfN2PQsuQz3jVIg==
X-Received: by 2002:a17:906:c154:b0:ade:2e4b:50d1 with SMTP id a640c23a62f3a-adfad415a59mr1002985066b.29.1750092291309;
        Mon, 16 Jun 2025 09:44:51 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfb53b3f5csm483311566b.142.2025.06.16.09.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:44:51 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: bp@alien8.de
Cc: dave.hansen@linux.intel.com,
	hpa@zytor.com,
	khaliidcaliy@gmail.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	tglx@linutronix.de,
	x86@kernel.org
Subject: Re: [PATCH] x86/startup: Let the caller retrieve encryption mask
Date: Mon, 16 Jun 2025 16:43:52 +0000
Message-ID: <20250616164404.879-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616153111.GAaFA4v85VGWp9qIrY@fat_crate.local>
References: <20250616153111.GAaFA4v85VGWp9qIrY@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> What Thomas told you about structuring commit messages:
>
> https://lore.kernel.org/r/875xgziprs.ffs@tglx
>
> Do it please and then send patches.
>
> Thx.

I apologies, i was aware, however English isn't my native language. 
I was grasping the doc as best i could. I sent v2 already.

Thanks
Khalid Ali

