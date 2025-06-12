Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A1537F8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767798; cv=none; b=TQktUY+VqclGETytc/HIQBNHk4gA5GBwonw5P/4qPmQEMARu0UecQ9OHzAhkxS98/yGhNnOAetupZZWDPyYITJXdU9moWU5eYCNJELGS8nMq1rfyfyUdnAPUYr7FId3keJ/CoBll3eiPrhsuy8JmjuNVYypVHaAPOvnGe5a830M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767798; c=relaxed/simple;
	bh=7xulCPXVhScf77ocienXAQH0tyuuMW7mAWLEdefz5Mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qV7wRzTb/EByoWqcb60RJjLR09hLGxbx+MAG89bJDyJE+GNDMUaIadhrrAGdTJQIPn/h/6xPzcAbTIpImRuoz7W9Cr+UUDZw/kvI9oi8LPxkkOACZvv8mexsCprPg4UK0fn0j5scxrXJwfBs8DFXjJZhpeBzOqRbcCng7ei094w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=loklCyLS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="loklCyLS"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54998f865b8so1363671e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749767795; x=1750372595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xulCPXVhScf77ocienXAQH0tyuuMW7mAWLEdefz5Mk=;
        b=loklCyLSBIWbDepinaOQW9Tqjlck0/Dht4cF45rIZcYONmgL/0skJqHmzScuSid0kh
         u96qZDqm8VnkJuSigvKltWVgW47Ka3tDeRukNF11doYmV8rps9WbFha7ELoKQ+4cB2qQ
         BHUa9SSNPb7kbu2D7DxdrjAIccs7BeDKaweLcWf0Xcy9Qomz8maaPRCODFYoDzzn7ORb
         DKuvyz4hvPhXXdT8T6cUXnMRHJvWW9Thkso1cwwW4O5CkJ+J1DRNeFR5eyC/5b6OD0AH
         FipTkKq16fKwk5JcWs5QKu0jPBz8Tu263QUGUHRJfxqZB1XyCPWV15WtWdvSek//Os2G
         0ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749767795; x=1750372595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xulCPXVhScf77ocienXAQH0tyuuMW7mAWLEdefz5Mk=;
        b=OfE41FgaCaFvtTCW0tEk4MmC5ya3BS9aBzgtvzvuTVTZJLOKK/ZLKtbHk5k/aOID6h
         Yz0Zqb/LOFxR+79m1YHcnRUwfXFW3cFjad91iIOZMk8ycxhRoK0imbD+0C5pxToL7GoC
         oHRQOYRWi9EKc58QJeWyrz+sdF7oD6kiIMXXG+pdrIVUZRIaktfEd+hmWp5JUGhI96H4
         wnq6F3yhCyU7T7w6SZdfpBgZ7/4mkWUpJi9tA60Mr0ulRICJ44jh+H3zwpgIawgFIlCG
         AOZCoNaWdfCd9jU0JlNOk5Dtsk/Ljws5oegwyGrGCBlSOWKMXiswrK8f4tR0xcU+JOVN
         57Wg==
X-Gm-Message-State: AOJu0YwktcsAqQkTPOe/RYnklPga9Xqf9qdQYTbyOR6Xqybmo/JVDE2j
	bv3kVnpMuziDmh0ql+V6fhIa3pQTziQmjizGL4RwNcsdsYOpQB/quuarXWXrX2Gh1c2o/DwOPo3
	cjJuCNXhoKBN2KRLekYoAVxDEDyx8LntBT+gDGkY=
X-Gm-Gg: ASbGncs6RqR7Cp4snTqSVPdq7ZdQDED4OzFwTXgN7GLtTa1gkcfdNXROilWtGyGZZTi
	dZdDIc7AjIclN9QozZJIjhV8CSryvJWCU6154osCrAI1sCamygmg87zjI0el64h+J/R9JAr63y4
	CFqDZV1of1783PX8TWMYIJLvVIMNYlhDxFMrE+zjeIQ3QRsPU35icqgheIGaZFJWf2YHxNdOKYk
	C9ggcUB+nM=
X-Google-Smtp-Source: AGHT+IGl0dDXnBGPIef0qxu8tOFUCVgIEThs+j6hmCCV4bdPc347k+COWCMfaNFMLwa+jweiXZQPJhzkBZTLk4DyTgw=
X-Received: by 2002:a05:6512:398b:b0:553:2cc1:2bba with SMTP id
 2adb3069b0e04-553af95ee64mr210885e87.31.1749767795412; Thu, 12 Jun 2025
 15:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519082042.742926976@linutronix.de> <20250519083025.715836017@linutronix.de>
In-Reply-To: <20250519083025.715836017@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 12 Jun 2025 15:36:24 -0700
X-Gm-Features: AX0GCFsxJlt95H0gfp-Y9RiXb9uKGp4ez_vZO90EG9M7VXdjEprJQT7MyGstH_A
Message-ID: <CANDhNComTYD4q-M5OjjYBjgDuLYBUKUZu41ghxQpAe7NPtT87A@mail.gmail.com>
Subject: Re: [patch V2 02/26] timekeeping: Cleanup kernel doc of __ktime_get_real_seconds()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
	Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:33=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Not a fan of empty commit messages, but:
Acked-by: John Stultz <jstultz@google.com>
