Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C805166F1A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322424; cv=none; b=YYGanQcoSMu5LEEs+LVMZRqM+Sp7J0EtAV6+zTE3assmXWM4/OCp7EPLsOuw8qWiX/ONcvJFRXrRrzAte0VWOmSBZJNCcGSmYPwpWZaN6cgVXGMgb9+BdPoNixG7CpCidlu7/5UijwcapP2s84vvwFNKOAfGJDC8PWqklAqVj4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322424; c=relaxed/simple;
	bh=Ufc/JLiYqVAipRJRii534cOUkZiwC/HjHDDVw3WxXZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyr/NlrnAON7kwVPl7uosJIpx+dYeyi/PGJJhBgGbaM3fDU+1s1+kRmMuc80v3NClGu4dUUUv4zYe24dTKA1LBbgDFjb50tJBU52BASPEaYi3AmHnITC8zJxyr9d3iHsZIsGZTkrP5gHiYIyq4sjrUKlrqSn3Ea5LtAJb53CHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WisCsWx/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WisCsWx/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23526264386so6138515ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750322422; x=1750927222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qe9QDHLeb2BcmtI9W7EcUmBr8ypmyD9JT4iW89KpGew=;
        b=WisCsWx/us/NC5iZtCmsBPN4wc3vwH4wanS0kgL0tGDb1iUexCriWxQIbCJI1GofbG
         ZjrdXkMMzNrI0N08V4Jt5U3S748+Nj0SEQkeysloib+kQexgiWYBwB0NN3raIR5VkcWm
         9lU1rIEaGdgIVtDVwK9d/lz+LNpplm6ntOeHPEd8LBtED3vWSVPX7Gb59FGsl/IIhBch
         11mkWZ9C+IN2+OquCISErXK0F67jwa/fz+WWaSxwO2unIRNhxC6hrOkNIaa6heA6tI8L
         6ARo3g6Vy+QAKaMH/7zPw60QbJAfWRyOjhsWJCLTSglqIkd/mdAiKqIfO7kwkvDOtcIO
         IQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322422; x=1750927222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qe9QDHLeb2BcmtI9W7EcUmBr8ypmyD9JT4iW89KpGew=;
        b=XtdjtGmzEf70qgSjQtjJWmWzsF/4SQnhkZ4F/rnQsBvc5s2YLUBPP21TOb5yk96R2y
         jimLr+jQSicGiC8ajcrvVTGMfwDP7S417B0DX8PfUMO1W7j/UbQRfpge+NEPxkpP/1lA
         1WtWNFlhzgmvxGYmU+BF+1iBsUyKZlFJjkHgREXWjiv/xgj+QTdRtypTv6o5+tTlv/yQ
         aIHmJUgCPt9akMEFkC6aqr5KGuYQwNOMoUy4rgQ/i/y4j9136PKwwZofdzgVBU/4LCVA
         r9GzGmMP4Cbq+hcofkxHJWj1BTM53SdpbqPfievINsykbmbqlh6XbpGoRzUwIjgguVUB
         9WiA==
X-Forwarded-Encrypted: i=1; AJvYcCXEFJiysWIWcjTMd/hOuV5oqT3bwWpXXkCNeuGq/u406rGOGWEoruL8BtnupqzshdSdrrh0EmKsh53nVIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJ1325N8f5OGbBRmEWi+w2w8Xv/EIrdoTe5Y4nZTaB6HhqxR8
	I5ZHFQ8yxhe7+FANYO981deWAoEo3BlqtqPOrTItbQZh0s0ume7/yDOOU0HJbEpZjfE=
X-Gm-Gg: ASbGnctmI4J8FapN6xqclIEeJjSi/whNXXH6dBEY56bfN02DMXHu8UWIWr3JSI4Tqc0
	DAIEG80bJ+3wGaUHQW2CVkgP+YjFF68RomvaW3nNXpuWmiVooSgkCWYS3yuVIqAn2PXcWn/5s34
	f8foZDl5+SWwR3MXfmfH67Lu3PiH7F86H4/1GG+Z0rOKboNo9hsi4Sdu2R1ouCO9pBPeMJQhjbC
	gTCVa/3j5HngLGjh1kX0mhCBgE2xRhZHRk8lj7eoVY3xKj23aUe/JaIu9ejzsMYr0o5VOAldfGe
	bxXus80dsrwlKoFVPforzZgh98Cvx5zO7hWeqLPRx1oW7fMMY3G8UR6ZxX5QA6I=
X-Google-Smtp-Source: AGHT+IGW5qplfc0e8GoHi2nYbNAnZvB4wAxetjyjKY3xR/zkK6nuq7qJNQAohJ/ZLfN9waxkJMbFsg==
X-Received: by 2002:a17:903:41c9:b0:235:ea0d:ae10 with SMTP id d9443c01a7336-2366b329eb4mr344216805ad.12.1750322422268;
        Thu, 19 Jun 2025 01:40:22 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm114351955ad.146.2025.06.19.01.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:40:21 -0700 (PDT)
Date: Thu, 19 Jun 2025 14:10:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav ananthu <abhinav.ogl@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: cpufreq: Ensure C ABI compatibility in all
 unsafe
Message-ID: <20250619084019.b36nwacofdixktdj@vireshk-i7>
References: <20250613101815.18092-1-abhinav.ogl@gmail.com>
 <20250619081601.yeulh36lhrqxo4ep@vireshk-i7>
 <CAGR7w80V_Atc_DuF1RGOFHbvXd1V2j8mMbN3yg+Q6oytiJwNbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGR7w80V_Atc_DuF1RGOFHbvXd1V2j8mMbN3yg+Q6oytiJwNbw@mail.gmail.com>

On 19-06-25, 14:07, Abhinav ananthu wrote:
> sure , should I make two different patches for opp.rs and cpufreq.rs or
> make the changes in a single patch?

Two patches.

-- 
viresh
