Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1A821ABDB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879699; cv=none; b=uqlKr03AzTBOjCzg08Q/oapHMMnwviLzaEUPK6WJRxHOR3myN7boYwkq2mXEwYEn5WBzJ/EYMB/nyfRhiFmX4tWOUGcvG1nMDpTsi6+OxXUSlJKOvYWmyYzUEt4VhTfPtuK1hvpoiKezgI2YUoWIiJVK8YJYCwrG4sW+4dONf0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879699; c=relaxed/simple;
	bh=rNqfOpdvWo3nU+69engpF5Ne/JYJBVZI+48pd8YR7LY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bV4PYYygNwBSMmO7JEYimYoXJX1LpuIYi0kv78146kDS0CP64YzcmXXYL8ZhzPkMl5b02eoUru5VXj70DtZJetm7UPEtAF8v2KecdmiOsjJ92sZhy4oaVB20+rKZTmimUJlSnGC41rWVg+1vlMV5OolMlV0YIBMzxyUUi/riNN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WD3lBCbC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WD3lBCbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744879696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rNqfOpdvWo3nU+69engpF5Ne/JYJBVZI+48pd8YR7LY=;
	b=WD3lBCbCsHH7fawV0VIjledaHtPsoOicSvjbQIRD4jj4Tmq7P7vrDsPwW0p/suVzs791tm
	rjRkJlcmlFyaMn0BcLy5SP8qsqOxnMjmVhGUuZQX5NOEDThPLrldjx0G7mbCa3Pc93WBth
	gOsBdM9nfshYj44QVevLKN2PLFnxfUo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-rLFhJhbrPgWzeWS2C9ZlWA-1; Thu, 17 Apr 2025 04:48:13 -0400
X-MC-Unique: rLFhJhbrPgWzeWS2C9ZlWA-1
X-Mimecast-MFC-AGG-ID: rLFhJhbrPgWzeWS2C9ZlWA_1744879693
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab397fff5a3so53286366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879693; x=1745484493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNqfOpdvWo3nU+69engpF5Ne/JYJBVZI+48pd8YR7LY=;
        b=P3xdur440FyJbH1ug9ynm8GIHpS5uk7NkBr7ydjkkx6YbPGOA1T9nngXnch6dJV94p
         ia+lLO/OMYMWD4/xhvq8wxV0+ShhMWuLOtguoJZgIm23L/zn4XiF9fOwgJEqmKs30MGg
         P0FPzwHnqGjvnE6X51mudf+nSnD3hjMiz0HjyVIaQHTrED2v8m8IGXyHJCqBjcK1ZXh7
         Uco4etw7Eta3dNQj72SaY2r6bt3NCOJ1LKMNDMoV7plX1XbhNrbwjrXACehFVVTqUr+x
         pXSYw0CL9TeJgdCHYF8flDgpmQ3Y00Cl7J6a9EaBlcNV3LTfnD5QcO9t8/adxKSG8nXu
         oTWw==
X-Forwarded-Encrypted: i=1; AJvYcCWxJfOZy5Ktb0m3/WmMKaFDdeuIaSzoTL/8gRJbhzx05n3GHyPK64fm4QXdZo52cLiPR/xkVeeQB1SLwO4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/SBidj9P95ikanilHT4E514yGC2oQsDYKNBIxjNMD53bFYPT0
	ewEIWAQ8uKVod1GIvjHhu82o3xwM2zAmF1kvbzMsEwxLlicZyYrI5jJWnZevU8MPqFY5HqTcbXf
	Xg/pgTkgUcDsb1GMvUc9bNfOll72J1n7GZvduvEP9ntJikyL24u20tBX5Cpqr4BKLE0eyu9HC2C
	p20oCt2MboRfXfGK4Unlx2dhcazpWfuaFr2ybm
X-Gm-Gg: ASbGncuGaoV9MRDUuzrGEA/EM6V8RxfvshYvwLO+RoEVu7gnJBLtuTQAJbVoJLYS+Yu
	gx70nxTDL/pdL9+/OXUUB6c2O5YOMzcs91I61tE1d3wXETdOgfoyYoXGk6fqIx240l6XW2cAUll
	y3S5AEkso988H/6JYWVYuDBDycfpw=
X-Received: by 2002:a17:907:c0c:b0:ac7:334d:3217 with SMTP id a640c23a62f3a-acb5a0a1cc9mr159897566b.12.1744879692743;
        Thu, 17 Apr 2025 01:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwisL56CNB6JWsN6ZU8eoAg09sybzZyfAG5BMAjq/z3wsnSgAeDIcUZetAvErtBlKk9IBiNOC4jLH9eX+Lfg8=
X-Received: by 2002:a17:907:c0c:b0:ac7:334d:3217 with SMTP id
 a640c23a62f3a-acb5a0a1cc9mr159895966b.12.1744879692307; Thu, 17 Apr 2025
 01:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330184641.1929409-1-costa.shul@redhat.com> <CAP4=nvS7nAfrMfb5L8A4DU0ZtGY7cxVD9gTLL-xV9jW3rU1rTA@mail.gmail.com>
In-Reply-To: <CAP4=nvS7nAfrMfb5L8A4DU0ZtGY7cxVD9gTLL-xV9jW3rU1rTA@mail.gmail.com>
From: Costa Shulyupin <costa.shul@redhat.com>
Date: Thu, 17 Apr 2025 11:47:36 +0300
X-Gm-Features: ATxdqUGN7ba5gRNdexibLVcLha16FrxdenSAnD-IPLQR8ct9qXqtpbHwbOJnd5Y
Message-ID: <CADDUTFzrUz9811qtOyvTObJnB61UoejxdXAqxV5Qr8bB9fD4ZA@mail.gmail.com>
Subject: Re: [PATCH v1] rtla: Set distinctive exit value for failed tests
To: Tomas Glozar <tglozar@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, John Kacur <jkacur@redhat.com>, 
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Eder Zulian <ezulian@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Jan Stancek <jstancek@redhat.com>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 09:30, Tomas Glozar <tglozar@redhat.com> wrote:
> Also, users might be already relying on rtla exiting with 0 on
> threshold violation. What do you think about adding a new command line
> argument, `--fail-on-threshold`, that would allow the user (including
> the test suite) to trigger the new behavior?
Although it is technically possible to rely on a failed value zero, I
suppose it is very unexpected. I expect current users only grep the
output of rtla.
I think adding a new command line argument is overcomplicated. Adding
a new command-line argument for this seems unnecessarily complex, and
I'm not aware of any Linux/POSIX tools that offer such an option.

Costa

