Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1902C20B1FB
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600848; cv=none; b=J277G+1QZUzNhpB83wKUc/KWm5slXr2JzbHVNdQkitYvE08x5u5jJoU1J7Dvm/FxcZvZE73t9l9ZIN/zwKR/ODr54TereF3YO50jo3t8a/iukNnDqoCIYjNZ5VyZOyDDJVEMwJ5zY64m4zuDdywTMrHcUbl2AN5T6N5eJnldtng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600848; c=relaxed/simple;
	bh=NUNo3NhYnhAcG5khMMn5VjutURlg3iEBzA1e88Cuuw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A18WElvjJ1fnuBjSvogEG5I0rwXjB4/Kk6TmTrQeBOr+Ye6yqqH176XlvR3NGyhGGtkzR16sT4qsvR3RNIU1gqTe60xUc1TKSV836u+QRJJqXqwAQA5CVi4vzSTdg6+gq0SAxhg8+e4N8BtLQXXgVn7/HnfLAHJA06OOAkBKRIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MtFnnEAS; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MtFnnEAS"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-467abce2ef9so489281cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 08:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738600846; x=1739205646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NUNo3NhYnhAcG5khMMn5VjutURlg3iEBzA1e88Cuuw0=;
        b=MtFnnEAS9AEamP2urUTMqrvk7Xlz0ZRdsZWm/ATko4GiJxePU4wRn18XqgcVIwjx7Y
         C5E0Bo6U9DtseSwkbSN6EkScpIS68WCkM1qcF7QZO2F6s6t5mvYUnc1sEEUQLyIRTUl3
         EAJ+07qPsOwKb3YXYvc+MvNUQgg4iew5T7HJYizjGlKTFjOSahfnNm2KnpXVPnU3awCk
         EWYfhtITD2ksoo/60sa4+8IFNVdgJuVHP7GjGTCSFqf+1nshyrwzuryx/cakwt2USqIr
         q+RUDYmlu1K3Ms4TfAlra0xYjS8JCIUGF4dPVI3G5i23cqFNoR1pAEtNPtCryZst/v01
         cOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600846; x=1739205646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUNo3NhYnhAcG5khMMn5VjutURlg3iEBzA1e88Cuuw0=;
        b=wQ+fI3JlpqN9VfRioZXIr6sy5zszzOxffByMpGLvvBcU5MlcxxB53h2Xo4PjXxAfSe
         K6z2LwxiEb0RqZoBNcCyxUTYPPSmL8xUC1tgzJ0xDydADQ29/ofAzSpbOHRSFc5VdzYW
         pFIxjsv43E0VV7dvIlFhwJag29qm2uR3pLy7JiR1akm3TnCVdwfaQUXH17lr1nnJYxEg
         D7BQzmm4pYmB2JOBsGUD8rmMZ3kqoqwBIp2zXF/P3Tthmw2okjQsiNxb4oveCQUw5qNz
         xUogUXt/pS9w3LK32oXpuo+arLqSRD2pIaX/UlsZLzHpNYViNVknIZ6R7WXUZG2FHeKQ
         HCLA==
X-Gm-Message-State: AOJu0YwH5EQAp/QzaB67u7a/9ekMNyG7DrXNedmnJPm06+JDH91juoqI
	QOzPg3HAYwUzGLMMHtAOYmmoTfvHBA+cQ12pvClLGZZ2tmInPIbeYONciB1sm0ZafTRHrjvY/NH
	Sd7n/9luypylIQbeElA4ZqR5JVlrpzD2EDkp6
X-Gm-Gg: ASbGncv7KLtRlI7Ag3mj1aW5TlMDRfk/A703NPeSWIsPnUne3fTtqwTxAEJ/5D42XGw
	hBlPlJYl3o2L65SWG47wG3pWyXrJfkSp38q06EBUZhk7I72Q/W4WuqxuRG4de1+Wd/SHPTigTCX
	etp0tj/QTpfoyXmaKJ0kFzxsxi7ts=
X-Google-Smtp-Source: AGHT+IEpbNGl2X3WCVlXhe7KrYcZy8phj2cHoKoZDux2ZkaYKFC6qeVBee7oTEU+L57MXVCpruKv6HjiU2sEl5SE2fo=
X-Received: by 2002:ac8:5ace:0:b0:466:a22a:6590 with SMTP id
 d75a77b69052e-4701832bd9emr129731cf.9.1738600845697; Mon, 03 Feb 2025
 08:40:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
In-Reply-To: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 3 Feb 2025 17:40:34 +0100
X-Gm-Features: AWEUYZmykqhW41Y-kitpSXHYpdsn6L85yKufn_KPSpUDrPneHWGed1oTMqbK_gc
Message-ID: <CA+i-1C3=9i92oA8T3H66DixY9b5A1y4oG5a5jcSn2aOD7CbDfw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] checkpatch: Add support for checkpatch-ignore note
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jan 2025 at 16:33, Brendan Jackman <jackmanb@google.com> wrote:
> Changes in v2:
> - Switched to the "graveyard" instead of the actual commit message.
> - Link to v1: https://lore.kernel.org/r/20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com

Hi Joe & Andy, any thoughts on this?
