Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7C728DEFE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859953; cv=none; b=PoBXUGAMglkZxF7hDzQVaI2J5pLHz0YUHXXz6SM5zWz/WyDaUZuOJYGBZTGuL9cNTVupEZVhH+jdfK7u9oLgrOrXcEqAx3PVYqJ/0YugZz9tSzILpnPuvXka4r45gQ02iRfPunSuZ8MMsJaOOHef2/B02WVTKkj8Mc/PIUMXJSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859953; c=relaxed/simple;
	bh=lQe6B4ESqBbPRYivTSLKeKkQR2sCU9faRpUdvpfXV+8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=AOIXkH9LeA0isbRa6mvdtZM0L5ltVrGxSvFp8oE7FD8e445FeZjvxVonB12uYfArjOZxIpL6ghbA+Vm9BMMQfVGsMtHbvVU/+aBVWC121O9gJ9Ow18AMMta/780lmmX6yDCB7X7LmkoN5D6t+Js8nldktBYpEELpwLcCmoX7/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCs3v2ra; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCs3v2ra"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2aeada833so980738666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745859948; x=1746464748; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lQe6B4ESqBbPRYivTSLKeKkQR2sCU9faRpUdvpfXV+8=;
        b=QCs3v2rapfEzUMZBvCJpiHcfoTgNd79aWDfQW5aVBneBW4vHRGlb/lW5TV3FSun0EV
         vm3V8BEP54wV0jRwzfKLBx/MHMcDIkAc2fX7EN+hZyl/kAbkzn6ryY9G2OAmSVDAE0pq
         TV/cYzivYC21cf2hRdvhV7F3o8GOOYB/xQIG7rD8VqSrW49DsUIVBfAwZPTOa9SBeELc
         80aW86GTNeTY6g7F6aq5OwtRrO7bhEnulAJd+bZWunRhLYs1b+Si8oCqJXhcoKPwFRuU
         iPQwhBB02T9wH/65WgVApP6VULgTq9RZSaImIMDXB7FHObbTc/QLDtyGoE6OX6wL+O6n
         gbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859948; x=1746464748;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQe6B4ESqBbPRYivTSLKeKkQR2sCU9faRpUdvpfXV+8=;
        b=lBqiSi1JWZpOkySJ6NYXnnM+rzkez4ESTV00j1N68LcExGYYG6YhDMSgLtOMUaPSmI
         kZVYaP5aRWv9uv1toBkcB+kzgLaTgq6ARhnJNzC4P58ouR8Rwi5yF2RkAFn4d1+EO1Xb
         vbfn5WRd93aI3+IAzKvWtoGIJfxCCuO6/cTNVTnF2/kiq1+dtY0xXC8dXD/tA4pixvOc
         cTeDTNSwZbSFyyL6wznW0YCz5kzNlyoahhphKgoqoBLA0Y38J0XGR1EmFnqg97rbDhV6
         dOBeLH02bxrVS3sleKh5I7FCBJDfV3LJvDMSFjK+UdCJ3JBbCNgeOLX6OGpi6LvgxXL4
         KxNQ==
X-Gm-Message-State: AOJu0YwTy6seUWjLsxog02g9ZpWrj4/euRlf0hEYA+6zRdTf5TRpAz6b
	OwmCZ2P+KraFtjcDaJsWPp/pJJS5YkBfCD4SYIGUMgtR65U6EY/DeNO9mURyXzst32Quc+qhhVV
	WnXFYPmK3jMPGykxQpFaWshllTYr8FJKV5UA=
X-Gm-Gg: ASbGncvwSAqH3wR/2ewnC4K7fpqEr8WUSpHMN45bPddYGH5OtJNrS3tjriEev8jWPDo
	rYDhM5kuzi/yljR7xaEkY4PMYd6Z5DobF6dZnZKIzpceSSUtAHvJnSe4W6Casi3imlpfJH1WXlH
	azuockc1VBfVD7IMJSzOTXhMWgNSs1nACD37Lb4Su/3QusUZlNX2QxM8x5YtXaHPHKVg==
X-Google-Smtp-Source: AGHT+IF8ZZhx8G2q4puS9nLTkOrZ5A3DwCUt7LLGmJlyF9Q+EoMqDfLfo/ivWx74hPACmI5+AmJTImsXv6fWsWFdYdo=
X-Received: by 2002:a17:907:7208:b0:ac7:3929:25f9 with SMTP id
 a640c23a62f3a-ace5a4854bbmr1448760666b.29.1745859947863; Mon, 28 Apr 2025
 10:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vitalii <skikunvitalii07@gmail.com>
Date: Mon, 28 Apr 2025 13:05:35 -0400
X-Gm-Features: ATxdqUFk1H_myUdQ3Io9FJvrxgMRqlb3rRVlGCUyjpyYHjbZi5p9qtp8aOrc2_o
Message-ID: <CALZ+hkMsavWPaJ4b2WOZi+aZ2CD0Og8Uq9VoHz1QA3n2_cPkdA@mail.gmail.com>
Subject: A FOSS Optical Illusion Captcha Algorithm for the Linux Kernel
 Mailing Lists.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Linux Kernel Mailing Lists need protection against denial of
service attacks and malicious code patch submissions made almost
effortless by machine learning algorithms.

By asking visitors to correctly say which direction of say, four (up,
down, left or right) a part of a captcha appears to be "moving", it
filters out the bots while allowing humans with optical illusion
fooled eyeballs to pass the test. Given 16 of those captcha requests
in a row and given that there are 2^2 choices per captcha, there is a
2^16*2 - 1 possible ways to enter 16 captchas wrong, but only 1 way to
enter them right, leading to a filtration failure of around 1 in 4
billion.
