Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6BA1FCFEF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750710495; cv=none; b=Iao7m68BerMbCPx9JRTkOSyX+apZwkJ4O86dc3uqRblBbS8OAZgl/8yvXZwnAdPLOHCMdvLKJLKzwQuM/XEPrWgKYdAOId/Mfd+/CMY0gyVF6sxDfWTQtAMq7/wER/CAoCbOEKxubPnom02LK0kf9HRmCMrbjqiqq497dXocr+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750710495; c=relaxed/simple;
	bh=KFAwq/5YtJXDUS0MzCOwxa42N5UUembrpnZlPw5SCMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+1/1TI4cQ0Ova9fTM6p2K7Qj1UaaGwH22CHAAx7lWlfL/Phnl64WFGxzWQFyMRXGTqc05jZElT03L4jAOANJiv1a0REYBZjeIjJPhZ4Dy5hcE065HZrAxUtrsf5lrxgYLcQsMyAH6otbQrHXZOzzRbU/1MymVhsJq32kVnmDsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rvirEHzC; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rvirEHzC"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e82314f9a51so3327758276.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750710493; x=1751315293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFAwq/5YtJXDUS0MzCOwxa42N5UUembrpnZlPw5SCMY=;
        b=rvirEHzCJq9n/nLdzvypbjt2BTUgMQ2uijeh6dfIKTHdIn9/m+jYZiGFKpxz7EHvCf
         aQmFUBexgB8y4bXfoJncpRyyiCpXvO6/eEsFdr7zow2m9qIZGVMbHx7WJHP0PU0MAvzm
         AcuofpGMBt5OP++xLPNs97jLeqvXlI14WqibOyy8VZt0e43IIj723EXU2mv1JpW5kRGU
         Ny301FxDSO+iTuWG+t4ZmfU307UxrKWiELlrrM3ufTHuNHgTBINvdjPMFugsWhIixJ9V
         lo7+00USAtxzNTShnMG0XpWMHyC9S2rFyKLynJtPkGbHpPH84wR7ZBfE3GGwpRoKMrFN
         Me0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750710493; x=1751315293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFAwq/5YtJXDUS0MzCOwxa42N5UUembrpnZlPw5SCMY=;
        b=TOPgaxSe1QyUSZOaLTpxNV1lsiLs+uG4Fgcg0ZhF7w+MoU1Cvm5hD7eHIhCT1MOUZ2
         ZH/RULnfle59AuVsV32x2/P9wlng+pKNNIpTbUgzyP6fm2v70qqnNkFCjyHt4OfuNNr+
         rGJDcqun6r/RgByyTdSLp4z4MNenpUuu5/ggwZAoCPQ8DYs9xVn7X7UBu8yC+gaENh49
         oSv66dtgeNJVijobQhYxkL3t+G8Smp5wpel+HYRxX4FVTacy7H34JfMhzuoFCbIYIgoc
         PCHSvgVZSJv9JnXUgxUBd1djjto5KcJyK3/7ICdqnEyxJiky59nNgVhwfuIhAiM2Ll2e
         9tdw==
X-Forwarded-Encrypted: i=1; AJvYcCVgOQUZfNx6qApVgNB6zR3lR9BMcLtcnEyj8Y4auaCem/oaQDtP73Z7yhLPAHaNKT0LieYt6qZHgO4e208=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1RnLcn9H2KpjkA/3o1djaE8Pda0RiEKkmIjJw9TCAM8XoDSpc
	pePxKY24Hil6eQev6mIVZfBl+jhd2uIHLen9jN7kuJGFJUmdXn7kJY1W9nZM0Tv2zrST53EkGd5
	il/i1WydWZ8j05nKQYTjEHnk6WX6g2hcKBMQXCeCt
X-Gm-Gg: ASbGncu3oP9471REjdA72QxwcKvR7tPjiPwH1wiBe5216dhRTHCZafo0I3s6Dy8O74l
	P5Ogm7F+JdQQc+XjOQcPEJrMTBa8H+aOBcC/xA9g656/4aFVm2JbMvCgzwlXq0XEGOd6QbH5Aop
	KSvVgMAPD13bBvNQ2U0pd2Uo3swPs1RRwjaFi8aCrZTUoJ4ujthpBaxbTnz+AizLFHvck3pEIF
X-Google-Smtp-Source: AGHT+IFhn8g/4nll/OHSLozO0+jYdEr+9gcsdRYg0nrp7CATUAdbRTIDFIEiQR8HWAFAUaJK1Lzmnr5wKnr8Pr14jBQ=
X-Received: by 2002:a05:6902:278a:b0:e81:7f36:5a37 with SMTP id
 3f1490d57ef6-e842bc7c261mr16797520276.8.1750710492876; Mon, 23 Jun 2025
 13:28:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619000343.3299526-2-rdbabiera@google.com> <2025061924-eats-john-8554@gregkh>
In-Reply-To: <2025061924-eats-john-8554@gregkh>
From: RD Babiera <rdbabiera@google.com>
Date: Mon, 23 Jun 2025 13:28:01 -0700
X-Gm-Features: AX0GCFt4xf7IL35aEI_H2kn6Loxq8nJCXegXuTjfSb5pbZqP8I0rGeW6Zg5SKFQ
Message-ID: <CALzBnUEcFrfE7xDkwkTT+XBoxKg=-Z94oDKjO_46n4h6i0VbbQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: altmodes/displayport: add irq_hpd to sysfs
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 9:32=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> Didn't checkpatch complain about not needing the {} here?

Surprisingly no, I'll fix it though, sorry about that.

Best,
RD
