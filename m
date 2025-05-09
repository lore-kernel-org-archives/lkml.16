Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A0D136672
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746803794; cv=none; b=AwiSDR9K/nn1ZH14VMxHSniMg7jRhwxAfLvksyp5nIclJw3mezYVRzV2lBOzuinA78gCFNqyFQaD4fwtXC17JMdgg8rZet6vJhfSHnogJdAMty1CJ/kP4b9mQCfF8Zca3CCLrEVa7408oUZDRy1uN9wWukH6uSJ8IRAgr20k3bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746803794; c=relaxed/simple;
	bh=/lUHvKx8B6SZJ5x6T9rqewPsosq1uT9ayxteuD9sIFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSu9X9Lk8Vonxvrp1ahMB4k1FA8IzZeUvYoQxp7NbKIH+ObdQTX9wvYf+VtKywUoD24Y2woS6zaIhGM6lHzmBBkhdjpklq+Cy4095XTgxe++CsS72Cp39L0HlEvONulW3nIU1WC/qZHRXrNumPYuPNLaXqjcJ84QhWKqaK3ZxcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=kKzZm9cq; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="kKzZm9cq"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c53b9d66fdso303718185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746803791; x=1747408591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1vjIEZsxX3cmymkqbeTODeZFcX3XnuYXcMXlg9gIa0=;
        b=kKzZm9cqkz0M8ljECTyH2IYuv1c/SMh8fUdemOZXjXbxVCm+PG9sNOJJQV+TWdQ4a3
         lfKRH9VgUwgcz8q5h99UFI0G3GbUuHhUUgHFcs35BvbtRK3Txt5VqQTmPSFda8gjo4R9
         EDN30atQ0BKS0qME8omSiYjzKM7ilHrJW9v64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746803791; x=1747408591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1vjIEZsxX3cmymkqbeTODeZFcX3XnuYXcMXlg9gIa0=;
        b=XcxM1oGGZkhNMXeXrHbvX2GFkVrmOhnn37P9WqAdwpzXZ5JQ6BBEdH9O984vYQMLrh
         3CDR/XxHyXBcwo3YstOIPS3feIwDu6LzgePZN8ji+0TcUzv6iA6/N/sGK/Pl65fCcRTD
         8pZgKNXV6h0WZh07uVRXlWQPx7MPWh+2YrLeyszFa8vB6LjuGCEwOwC5SRdlqYMFZCKc
         1r0oUIuk175WAAKTfS1zjkCVU1wHaqJlpnB+/zYZjzwGu0qHgFJw7A1Zl20glKcmUWEK
         8RujVIO8hDW/atMH54xwQcGPzcfdg5/VBF5aQtTOwUT7vladYbmVOjOWPpEkpTJGF+fx
         79VQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5QERXOPgE/QaSZdBpTYSHVQZkCf2qIy25aaRuefyBQRu7vZmmKHsOrqyzP5ei/oqkve6o0pF35TYZCrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZujp18/MsbLjVndZRD8cFanRvK1laF7yjy5Gg7A++sj4vq/gG
	CjS739kwQ44v0q4qNAUfsu+0gQfFDZmv5CAT3/Jkx3nbarAJofxDxuQh3W2rcvq9RUmqXF6VwVQ
	Aqmbl7p2mZIQWQ2hExBGywvJ6Vq2xqo4nSoziNtHNaTCBLd2D
X-Gm-Gg: ASbGnctxOEFhP+caPpR7F1SFsbZw4iP2Ldw7Jr0pVIPBeoAOn2BrWLhuPLbAe4JvnBW
	YGSt3t3thREG0OfpbdqG3N8d1Lnuil1SpU07v5ruqi2mmZZ3KuaZ1fQzUYm3z8QaUwCSR/Li4xs
	yRJOB5V4wBinhmPidHAYA5UTcC
X-Google-Smtp-Source: AGHT+IFliv6k+QiBSpaqMzGO+mimn0fx9dJObJL+mECZXgnCPAGA4+Lphwg/oH/VOOvYw70gEcH6XSp7M7YvmV8KJ0s=
X-Received: by 2002:a05:622a:1ba8:b0:48a:df4a:cafa with SMTP id
 d75a77b69052e-494527e0dc1mr44322841cf.51.1746803779851; Fri, 09 May 2025
 08:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com>
 <20250509-fusectl-backing-files-v3-2-393761f9b683@uniontech.com>
 <CAJfpegvhZ8Pts5EJDU0efcdHRZk39mcHxmVCNGvKXTZBG63k6g@mail.gmail.com>
 <CAC1kPDPeQbvnZnsqeYc5igT3cX=CjLGFCda1VJE2DYPaTULMFg@mail.gmail.com>
 <CAJfpegsTfUQ53hmnm7192-4ywLmXDLLwjV01tjCK7PVEqtE=yw@mail.gmail.com> <CAC1kPDMweHDtktTt=aSFamPNUWjt8nKw09U_2EqyDNu28H6WWg@mail.gmail.com>
In-Reply-To: <CAC1kPDMweHDtktTt=aSFamPNUWjt8nKw09U_2EqyDNu28H6WWg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 9 May 2025 17:16:09 +0200
X-Gm-Features: ATxdqUGN1u1bbPdP_oEYzlaSAFIoFBNum5f1Y6ZsHZkVMZADh61LHYvK7YaCw1A
Message-ID: <CAJfpegvqSsa7XyQyO9ugv0=tLhLDg8GSyd8HO8TG2e_nLxJVHg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] fs: fuse: add backing_files control file
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 9 May 2025 at 17:11, Chen Linxuan <chenlinxuan@uniontech.com> wrote=
:
>
> On Fri, May 9, 2025 at 10:59=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu=
> wrote:
>
> > And that has limitations, since fdinfo lacks a hierarchy.  E.g.
> > recursively retrieving "hidden files" info is impractical.
>
> What does "recursively" refer to in this context?
> I am not entirely sure what kind of situation it implies.
> Do you mean, for example, when a fixed file is a FUSE fd and it has a
> backing file?

Yeah.  I don't see any practical relevance today, but allowing to
retrieve any attribute of these hidden files (fdinfo and hidden files
included) is a good thing that the flat nature of the current fdinfo
inteface makes difficult.

I'd argue that many current uses of fdinfo could be enabled with the
listxattr/getxattr inteface and would improve usablility (no need to
parse the fdinfo file to skip unneeded info).

Thanks,
Miklos
>
> Thanks,
> Chen Linxuan
